package ssm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import ssm.entity.User;

/**
 * description 登录认证拦截器
 * @author lixujia
 *
 */
public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//获取请求的URL
		String url = request.getRequestURI();
		//在配置文件中配置公开地址...
		//判断是否进行登录操作
		if (url.indexOf("login")>=0) {
			return true;//放行
		}
		//判断是否是已经登录的用户
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginUser");
		if (user!=null) {
			return true;
		}
		//用户身份需要验证,请求转发到登录界面
		request.getRequestDispatcher("login.jsp").forward(request, response);
		
		return false;
		//还没有在配置文件中配置拦截器
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		
	}

}
