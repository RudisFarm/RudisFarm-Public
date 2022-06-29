package kr.co.rudisfarm.model.commons.captcha;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nl.captcha.Captcha;
import nl.captcha.audio.AudioCaptcha;
import nl.captcha.servlet.CaptchaServletUtil;
import nl.captcha.audio.producer.VoiceProducer;
public class AudioCaptCha {

    public void getAudioCaptCha(HttpServletRequest req, HttpServletResponse res, String answer) 

      throws IOException{
    	
        HttpSession session = req.getSession();
        
        //Captcha.NAME = 'simpleCaptcha'
        Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
        String getAnswer = answer; 

        if ( getAnswer == null || getAnswer.equals("") ) getAnswer = captcha.getAnswer();

      /*  AudioCaptcha audiocaptcha = new AudioCaptcha.Builder()
                           //.addAnswer(new DefaultTextProducer(6, getAnswer.toCharArray())) 또는 다음과 같이...
                           .addAnswer(new SetTextProducer(getAnswer))
                           .addNoise() //잡음추가
                           .build();*/

        VoiceProducer vProd = new SetKorVoiceProducer(); //한글 음성을 생성해주는 객체 생성
        AudioCaptcha audiocaptcha = new AudioCaptcha.Builder()
        .addAnswer(new SetTextProducer(getAnswer))
        .addVoice(vProd) //한글음성생성기를 AudioCaptcha에 적용
        .addNoise()
        .build();
        
        CaptchaServletUtil.writeAudio(res, audiocaptcha.getChallenge());

    }
}
