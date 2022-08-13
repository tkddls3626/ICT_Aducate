package kopo.poly.controller;

import kopo.poly.dto.NoticeDTO;
import kopo.poly.dto.UserInfoDTO;
import kopo.poly.service.IUserService;
import kopo.poly.service.impl.UserService;
import kopo.poly.util.CmmUtil;
import kopo.poly.util.EncryptUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @GetMapping(value = "signUp")
    public String signUp() throws Exception {
        log.info(this.getClass().getName()+".signUp Start!!");
        log.info(this.getClass().getName()+".signUp End!!");
        return "userForm";
    }

    @GetMapping(value = "login")
    public String login() throws Exception {
        log.info(this.getClass().getName()+".login Start!!");
        log.info(this.getClass().getName()+".login End!!");
        return "login";
    }
    @GetMapping(value = "register")
    public String register() throws Exception {
        log.info(this.getClass().getName()+".login Start!!");
        log.info(this.getClass().getName()+".login End!!");
        return "user/register";
    }
    @GetMapping(value = "forget_id")
    public String forget_id() throws Exception {
        log.info(this.getClass().getName()+".forget_id Start!!");
        log.info(this.getClass().getName()+".forget_id End!!");
        return "user/forget_id";
    }
    @GetMapping(value = "forget_pwd")
    public String forget_pwd() throws Exception {
        log.info(this.getClass().getName()+".forget_pwd Start!!");
        log.info(this.getClass().getName()+".forget_pwd End!!");
        return "user/forget_pwd";
    }

    @PostMapping("userInsert")
    public String userInsert(HttpServletRequest request, HttpServletRequest response, Model model) throws Exception {
        log.info(this.getClass().getName() + ".getInsertUser Start!!");
        String user_id = CmmUtil.nvl(request.getParameter("user_id"));
        String password = EncryptUtil.encHashSHA256(CmmUtil.nvl(request.getParameter("user_pwd")));
        String user_email = EncryptUtil.encAES128CBC(CmmUtil.nvl(request.getParameter("user_email")));
        String user_name = CmmUtil.nvl(request.getParameter("user_name"));
        String age = CmmUtil.nvl(request.getParameter("user_age"));

        log.info("받아온 아이디 : "+user_id);
        log.info("받아온 비번 : "+password);
        log.info("받아온 이메일 : "+user_email);
        log.info("받아온 이름 : "+user_name);
        log.info("받아온 나이 : "+age);

        UserInfoDTO uDTO = new UserInfoDTO();
        uDTO.setUser_id(user_id);
        uDTO.setPassword(password);
        uDTO.setUser_email(user_email);
        uDTO.setUser_name(user_name);
        uDTO.setAge(age);

        int res = userService.InsertUserInfo(uDTO);
        String msg;
        String url;
        String icon;

        if(res > 0){
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
    public String userCheck(HttpServletRequest request, Model model, HttpSession session) throws Exception{
        log.info(this.getClass().getName() + ".userCheck Start!!");
        String user_id = CmmUtil.nvl(request.getParameter("user_id"));
        String password = EncryptUtil.encHashSHA256(CmmUtil.nvl(request.getParameter("user_pwd")));
        String msg;
        String url;
        String icon;

        log.info("받아온 아이디 : "+user_id);
        log.info("받아온 비번 : "+password);

        UserInfoDTO uDTO = new UserInfoDTO();
        uDTO.setUser_id(user_id);
        uDTO.setPassword(password);

        UserInfoDTO rDTO = userService.ChkUserInfo(uDTO);
        log.info("로그인 조회 결과는 :" + rDTO);

        if(rDTO == null) {
            msg = "로그인에 실패하셨습니다.";
            icon= "fail";
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
        return "myInfo";
    }

    @PostMapping(value = "myInfoUpdate")
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
        return "myInfoUpdate";
    }
    @PostMapping(value = "userInfoUpdate")
    public String userInfoUpdate(HttpServletRequest request, Model model, HttpSession session) throws Exception{
        log.info(this.getClass().getName()+".userInfoUpdate End!!");
        String user_seq = (String) session.getAttribute("sessionNo");
        String user_id = CmmUtil.nvl(request.getParameter("user_id"));
        String user_email = EncryptUtil.encAES128CBC(CmmUtil.nvl(request.getParameter("user_email")));
        String user_name = CmmUtil.nvl(request.getParameter("user_name"));
        log.info("user_seq : "+user_seq);

        UserInfoDTO uDTO = new UserInfoDTO();
        uDTO.setUser_seq(user_seq);
        uDTO.setUser_id(user_id);
        uDTO.setUser_email(user_email);
        uDTO.setUser_name(user_name);

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
}
