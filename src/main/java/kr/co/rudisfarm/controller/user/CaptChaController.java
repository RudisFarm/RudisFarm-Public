package kr.co.rudisfarm.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.rudisfarm.model.commons.captcha.AudioCaptCha;
import kr.co.rudisfarm.model.commons.captcha.CaptCha;
import nl.captcha.Captcha;

@Controller
public class CaptChaController {
	
	@RequestMapping("/captcha/cap")
	public String captcha() throws Exception {
		return "/captcha/captcha2";
	}

	@RequestMapping("/captcha/CaptChaImg")
	public void CaptChaImg(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 new CaptCha().getCaptCha(request, response); 
	}
	
	/*
	 * @RequestMapping("/captcha/CaptChaAudio") public void
	 * CaptChaAudio(HttpServletRequest request, HttpServletResponse response )
	 * throws Exception { Captcha captcha = (Captcha)
	 * request.getSession().getAttribute(Captcha.NAME); String getAnswer =
	 * captcha.getAnswer(); //CaptsCha Image에 사용된 문자열을 반환한다. new
	 * AudioCaptCha().getAudioCaptCha(request, response, getAnswer); }
	 */

	@ResponseBody
	@RequestMapping("/captcha/CaptchaSubmit")
	public String CaptchaSubmit(HttpServletRequest request, HttpServletResponse response ) throws Exception {
		
		System.out.println("CaptchaSubmit!!!!!");
		String rst = "";
		Captcha captcha = (Captcha) request.getSession().getAttribute(Captcha.NAME);
		
		System.out.println("캡챠 존재 여부 : " + captcha);
		String answer = request.getParameter("answer"); //사용자가 입력한 문자열
		
		if(captcha != null) {
			if ( answer != null && !"".equals(answer) ) {
				if (captcha.isCorrect(answer)) { //사용자가 입력한 문자열과 CaptCha 클래스가 생성한 문자열
					request.getSession().removeAttribute(Captcha.NAME);
					rst = "s";//"입력값이 일치 합니다.";
				} else {
					rst = "e";//"입력값이 일치 하지 않습니다.";
				}
			} 
		} else {
			rst = "p";//"이미 인증되었습니다.";
		}
		
		

		System.out.println("rst : " + rst);
		return rst;
	}
	
}
