package kr.co.rudisfarm.model.commons.applicationlistener;

import java.util.HashMap;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Service;

import kr.co.rudisfarm.model.commons.aysnc.AsyncBizRegInfoCheckTask;
import kr.co.rudisfarm.model.commons.aysnc.AsyncConfig;

@Service
public class Startup {
	@Resource(name = "AsyncBizRegInfoCheckTask")
	private AsyncBizRegInfoCheckTask asyncBizRegInfoCheckTask;
	
	@Resource(name = "asyncConfig")
    private AsyncConfig asyncConfig;

	@PostConstruct
	public void init() {
		try {
			if(asyncConfig.isSampleTaskExecute()) {
				asyncBizRegInfoCheckTask.BizRegInfoCheckTask();
			} else {
				System.out.println("쓰레드 갯수 초과");
			}
		} catch (Exception e) {
			System.out.println("==============>>>>>>>>>>>> THREAD ERROR");
            System.out.println("TaskRejectedException : 등록 개수 초과");
            System.out.println("==============>>>>>>>>>>>> THREAD END");
            e.printStackTrace();
		}
	}
}
