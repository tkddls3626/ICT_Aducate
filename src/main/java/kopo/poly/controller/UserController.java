package kopo.poly.controller;

import kopo.poly.dto.MailDTO;
import kopo.poly.dto.NoticeDTO;
import kopo.poly.dto.UserInfoDTO;
import kopo.poly.service.IMailService;
import kopo.poly.service.IUserService;
import kopo.poly.service.impl.UserService;
import kopo.poly.util.CmmUtil;
import kopo.poly.util.EncryptUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Slf4j
@Controller
public class UserController {

    //서비스로 연결
    @Resource(name = "UserService")
    private IUserService userService;
    //메일 서비스 발송을 위한 쿼리
    @Resource(name = "MailService")
    private IMailService mailService;


    @GetMapping(value = "signUp")
    public String signUp() throws Exception {
        log.info(this.getClass().getName() + ".signUp Start!!");
        log.info(this.getClass().getName() + ".signUp End!!");
        return "userForm";
    }

    @GetMapping(value = "login")
    public String login() throws Exception {
        log.info(this.getClass().getName() + ".login Start!!");
        log.info(this.getClass().getName() + ".login End!!");
        return "login";
    }

    @GetMapping(value = "register")
    public String register() throws Exception {
        log.info(this.getClass().getName() + ".login Start!!");
        log.info(this.getClass().getName() + ".login End!!");
        return "user/register";
    }

    @GetMapping(value = "forget_id")
    public String forget_id() throws Exception {
        log.info(this.getClass().getName() + ".forget_id Start!!");
        log.info(this.getClass().getName() + ".forget_id End!!");
        return "user/forget_id";
    }

    @GetMapping(value = "forget_pwd")
    public String forget_pwd() throws Exception {
        log.info(this.getClass().getName() + ".forget_pwd Start!!");
        log.info(this.getClass().getName() + ".forget_pwd End!!");
        return "user/forget_pwd";
    }

    @PostMapping("userInsert")
    public String userInsert(HttpServletRequest request, HttpServletRequest response, Model model) throws Exception {
        log.info(this.getClass().getName() + ".getInsertUser Start!!");
        String user_id = CmmUtil.nvl(request.getParameter("user_id"));
        String password = EncryptUtil.encHashSHA256(CmmUtil.nvl(request.getParameter("user_pwd")));
        String user_email = CmmUtil.nvl(request.getParameter("user_email"));
        String user_name = CmmUtil.nvl(request.getParameter("user_name"));
        String age = CmmUtil.nvl(request.getParameter("user_age"));
        String sex = CmmUtil.nvl(request.getParameter("sex"));

        log.info("받아온 아이디 : " + user_id);
        log.info("받아온 비번 : " + password);
        log.info("받아온 이메일 : " + user_email);
        log.info("받아온 이름 : " + user_name);
        log.info("받아온 나이 : " + age);
        log.info("받아온 나이 : " + sex);

        UserInfoDTO uDTO = new UserInfoDTO();
        uDTO.setUser_id(user_id);
        uDTO.setPassword(password);
        uDTO.setUser_email(user_email);
        uDTO.setUser_name(user_name);
        uDTO.setAge(age);
        uDTO.setSex(sex);

        int res = userService.InsertUserInfo(uDTO);
        String msg;
        String url;
        String icon;

        if (res > 0) {
            msg = "등록에 성공하셨습니다.";
            icon = "success";
            url = "/login";
        } else {
            msg = "등록에 실패하셨습니다.";
            icon = "fail";
            url = "/index";
        }
        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        log.info(this.getClass().getName() + ".getInsertUser End!!");
        return "redirect";
    }

    @PostMapping(value = "userCheck")
    public String userCheck(HttpServletRequest request, Model model, HttpSession session) throws Exception {
        log.info(this.getClass().getName() + ".userCheck Start!!");
        String user_id = CmmUtil.nvl(request.getParameter("user_id"));
        String password = EncryptUtil.encHashSHA256(CmmUtil.nvl(request.getParameter("user_pwd")));
        String msg;
        String url;
        String icon;

        log.info("받아온 아이디 : " + user_id);
        log.info("받아온 비번 : " + password);

        UserInfoDTO uDTO = new UserInfoDTO();
        uDTO.setUser_id(user_id);
        uDTO.setPassword(password);

        UserInfoDTO rDTO = userService.ChkUserInfo(uDTO);
        log.info("로그인 조회 결과는 :" + rDTO);

        if (rDTO == null) {
            msg = "로그인에 실패하셨습니다.";
            icon = "fail";
            url = "/login";
        } else {
            msg = "로그인에 성공하셨습니다.";
            icon = "success";
            url = "/index";
            String name = rDTO.getUser_name();
            String no = rDTO.getUser_seq();
            session.setAttribute("sessionId", name);
            session.setAttribute("sessionNo", no);
            log.info("sessionID : " + name);
            log.info("sessionSEQ : " + no);
        }

        model.addAttribute("msg", msg);
        model.addAttribute("url", url);
        model.addAttribute("icon", icon);

        log.info(this.getClass().getName() + ".userCheck End!!");
        return "redirect";
    }

    @GetMapping(value = "logoutSession")
    public String logoutSession(HttpSession session, Model model) {
        log.info(this.getClass().getName() + ".logoutSession Start!!");

        session.invalidate();

        String msg = "로그아웃 되었습니다.";
        String url = "/login";

        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        log.info(this.getClass().getName() + ".logoutSession End!!");
        return "redirect";
    }

    // 유저 ID찾기 ---> 이메일 전송
    @PostMapping(value = "forget_id")
    public String findID(HttpServletRequest request, ModelMap model) throws Exception {

        log.info(this.getClass().getName() + ".findPw start!");

        String msg = "";
        String url = "";
        String icon = "";
        String contents = "";

        try {
            // 이메일 AES-128-CBC 암호화
            String user_name = CmmUtil.nvl(request.getParameter("user_name"));
            String user_email = CmmUtil.nvl(request.getParameter("user_email"));

            UserInfoDTO uDTO = new UserInfoDTO();

            uDTO.setUser_name(user_name);
            uDTO.setUser_email(user_email);
            log.info("user_name : " + user_name);
            log.info("user_email : " + user_email);

            UserInfoDTO rDTO = userService.findUserId(uDTO);

            log.info("rDTO : " + rDTO);
            if (rDTO != null) {
                String user_id = rDTO.getUser_id();
                msg = "아이디 찾기 성공!";
                icon = "success";
                contents = "해당하는 아이디 : " + user_id;
            } else {
                msg = "아이디 찾기 실패!";
                icon = "warning";
                contents = "이름과 이메일을 확인해주세요.";
            }
            url = "/login";


        } catch (Exception e) {
            msg = "서버 오류입니다.";
            url = "/forget_id";
            log.info(e.toString());
            e.printStackTrace();
        }

        model.addAttribute("msg", msg);
        model.addAttribute("url", url);
        model.addAttribute("icon", icon);
        model.addAttribute("contents", contents);

        log.info(this.getClass().getName() + ".findPw end!");

        return "redirect";
    }

    // 유저 비밀번호 찾기 --> 새비밀번호 전송 (비밀번호를모를때)
    @PostMapping(value = "forget_pwd")
    public String findPw(HttpServletRequest request, ModelMap model) throws Exception {

        log.info(this.getClass().getName() + ".findPw start!");

        String msg = "";
        String url = "";
        String icon = "";
        String contents = "";

        try {

            String newPW = String.valueOf((int) (Math.random() * 1000000));

            // 이메일 AES-128-CBC 암호화
            String user_email = CmmUtil.nvl(request.getParameter("user_email"));
            String user_id = CmmUtil.nvl(request.getParameter("user_id"));
            // 비밀번호 해시 알고리즘 암호화
            String user_pw = EncryptUtil.encHashSHA256(newPW);

            UserInfoDTO pDTO = new UserInfoDTO();
            pDTO.setPassword(user_pw);
            pDTO.setUser_email(user_email);
            pDTO.setUser_id(user_id);
            log.info("user_email : " + user_email);
            log.info("user_pw : " + user_pw);
            log.info("user_id :" + user_id );

            int res = userService.updateUserPw(pDTO);
            log.info("res : " + res);

            if (res == 1) {

                MailDTO rDTO = new MailDTO();
                rDTO.setToMail(user_email);
                log.info("email : " + user_email);
                rDTO.setTitle("######의 새비밀번호 전송!!!");
                rDTO.setContents("new password : " + newPW);
                log.info("newPW : " + newPW);

                int mailRes = mailService.doSendMail(rDTO);

                if (mailRes == 1) {
                    msg = "비밀 번호 변경 성공!";
                    icon = "success";
                    contents = "새 비밀번호를 이메일로 발송했습니다. 로그인 후 변경해주세요.";
                } else {
                    msg = "비밀 번호 변경 실패!";
                    icon = "warning";
                    contents = "변경된 비밀번호 발송에 실패했습니다. ####@naver.com 으로 문의해주세요.";
                }
                url = "/login";

            } else if (res == 0) {
                msg = "정보를 다시 확인해주세요.";
                icon = "warning";
                contents = "정확한 정보를 입력해주세요!";
            }

        } catch (Exception e) {
            msg = "서버 오류입니다.";
            icon = "warning";
            contents = "서버 오류입니다 관리자에게 문의해주세요";
            log.info(e.toString());
            e.printStackTrace();
        }
        model.addAttribute("msg", msg);
        log.info(url);
        model.addAttribute("url", url);
        model.addAttribute("icon", icon);
        model.addAttribute("contents",contents);

        log.info(this.getClass().getName() + ".findPw end!");

        return "redirect";
    }
    @GetMapping(value = "userDelete")
    public String userDelete(HttpServletRequest request, Model model, HttpSession session) throws Exception {
        log.info(this.getClass().getName() + ".userDelete Start!!");
        String user_seq = request.getParameter("uno");
        log.info("uno : "+user_seq);

        UserInfoDTO uDTO = new UserInfoDTO();
        uDTO.setUser_seq(user_seq);

        int res = userService.getUserDelete(uDTO);

        String msg, url = "/getNoticeList";
        if(res > 0) {
            msg = "회원 탈퇴 성공";
            session.invalidate();
        } else {
            msg = "회원 탈퇴 실패";
        }

        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        log.info(this.getClass().getName() + ".userDelete End!!");
        return "redirect";
    }

    @GetMapping(value = "myInfo")
    public String myInfoShow(HttpServletRequest request, Model model, HttpSession session) throws Exception {
        log.info(this.getClass().getName() + ".myInfoShow Start!!");
        String user_seq = (String) session.getAttribute("sessionNo");
        log.info("user_seq : "+user_seq);

        UserInfoDTO uDTO = new UserInfoDTO();
        uDTO.setUser_seq(user_seq);

        UserInfoDTO rDTO = userService.getUserDetail(uDTO);
        if(rDTO == null){
            model.addAttribute("msg", "존재하지 않는 사용자입니다.");
            model.addAttribute("url", "index");
            return "redirect";
        }
        model.addAttribute("rDTO", rDTO);
        log.info(this.getClass().getName() + ".myInfoShow End!!");
        return "/mypage/myInfo";
    }

    @GetMapping(value = "myInfoUpdate")
    public String myInfoUpdate(HttpServletRequest request, Model model, HttpSession session) throws Exception {
        log.info(this.getClass().getName()+".myInfoUpdate Start!!");

        String user_seq = (String) session.getAttribute("sessionNo");
        log.info("user_seq : "+user_seq);

        UserInfoDTO uDTO = new UserInfoDTO();
        uDTO.setUser_seq(user_seq);

        UserInfoDTO rDTO = userService.getUserDetail(uDTO);
        if(rDTO == null){
            model.addAttribute("msg", "존재하지 않는 사용자입니다.");
            model.addAttribute("url", "index");
            return "redirect";
        }
        model.addAttribute("rDTO", rDTO);

        log.info(this.getClass().getName()+".myInfoUpdate End!!");
        return "/mypage/myInfoUpdate";
    }
    //내 정보 변경
    @PostMapping(value = "userInfoUpdate")
    public String userInfoUpdate(HttpServletRequest request, Model model, HttpSession session) throws Exception{
        log.info(this.getClass().getName()+".userInfoUpdate End!!");
        String user_seq = (String) session.getAttribute("sessionNo");
        String user_id = CmmUtil.nvl(request.getParameter("user_id"));
        String user_email = CmmUtil.nvl(request.getParameter("user_email"));
        String user_name = CmmUtil.nvl(request.getParameter("user_name"));
        String age = CmmUtil.nvl(request.getParameter("age"));
        String sex = CmmUtil.nvl(request.getParameter("sex"));
        log.info("user_seq : "+user_seq);

        UserInfoDTO uDTO = new UserInfoDTO();
        uDTO.setUser_seq(user_seq);
        uDTO.setUser_id(user_id);
        uDTO.setUser_email(user_email);
        uDTO.setUser_name(user_name);
        uDTO.setAge(age);
        uDTO.setSex(sex);

        int res = userService.getUserUpdate(uDTO);

        String msg, url = "/myInfo";
        if(res > 0) {
            msg = "정보 수정 성공";
            session.setAttribute("sessionId", user_name);
        } else {
            msg = "정보 수정 실패";
        }

        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        log.info(this.getClass().getName()+".userInfoUpdate End!!");
        return "redirect";
    }
    // 내정보 비밀번호 변경
    @PostMapping(value = "updateUserPw")
    public String updateUserPw(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {

        log.info(this.getClass().getName() + ".updateUserPw start");

        String msg = "";
        String url = "";

        String user_seq = CmmUtil.nvl(request.getParameter("sessionNo"));
        // 비밀번호 해시 알고리즘 암호화
        String user_pw = EncryptUtil.encHashSHA256(CmmUtil.nvl(request.getParameter("user_pw")));

        log.info("user_seq : " + user_seq);


        UserInfoDTO pDTO = new UserInfoDTO();
        pDTO.setUser_seq(user_seq);
        pDTO.setPassword(user_pw);

        int res = userService.updateUserPw(pDTO);

        if (res == 1) {
            msg = "성공적으로 비밀번호를 변경했습니다. 다시 로그인 해주세요";
            url = "/login";
        } else {
            msg = "비밀번호 저장에 실패했습니다.";
            url = "/updatePasswd";
        }

        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        log.info(this.getClass().getName() + ".updateUserPw end");

        return "redirect";
    }
    @GetMapping(value = "updatePasswd")
    public String updatePasswd(HttpSession session) {
        log.info(this.getClass().getName() + "loginStart");
        return "mypage/updatePasswd";
    }
    @GetMapping(value = "game")
    public String game(HttpSession session) {
        log.info(this.getClass().getName() + "gameStart");
        return "game/game";
    }
}
