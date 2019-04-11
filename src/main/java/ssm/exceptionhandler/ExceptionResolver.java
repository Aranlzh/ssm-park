package ssm.exceptionhandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/**
 * @description 全局异常类处理异常
 * @author lixujia
 *
 */
public class ExceptionResolver implements HandlerExceptionResolver {

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		MyException myException = null;
		//解析异常类型
		//如果该异常是系统自定义的异常，直接取出异常信息，在错误页面显示
		if (ex instanceof MyException) {
			myException = (MyException) ex;
		}else {
			//若不是自定义异常，该异常为运行时异常，设置异常信息为“未知错误”
			myException = new MyException("未知错误!!!");
		}
		//获取异常信息
		String message = myException.getMessage();
		
		ModelAndView modelAndView = new ModelAndView();
		//将异常信息传给错误页面
		modelAndView.addObject("message", message);
		modelAndView.setViewName("error");
		
		return modelAndView;
	}
}
