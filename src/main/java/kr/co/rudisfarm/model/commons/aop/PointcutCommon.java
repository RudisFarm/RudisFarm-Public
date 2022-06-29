package kr.co.rudisfarm.model.commons.aop;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class PointcutCommon {
	@Pointcut("execution(* kr.co.rudisfarm.model..*.*impl.*(..))")
	public void allPointcut() {}
}
