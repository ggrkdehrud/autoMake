package set.set.set.serviceImpl;

import java.lang.reflect.Method;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import set.set.set.bean.HomeBean;
import set.set.set.dao.HomeDao;
import set.set.set.service.HomeService;

@Service("HomeService")
public class HomeServiceImpl implements HomeService{
	
	@Resource(name="HomeDao")
	private HomeDao HomeDao;
	
	@Override
	public HomeBean readData(HomeBean homeBean) {
		HomeBean newHomeBean = null;
		try {
			newHomeBean = new HomeBean();
			Method[] methods = homeBean.getClass().getMethods();
			
			for(Method method : methods) {
				if(method.getName().contains("get")) {
					if(method.getName().equals("getClass")) {
						continue;
					}
					String nowMethod = method.getName().replaceAll("get", "set");
					newHomeBean.getClass().getMethod(nowMethod, method.getReturnType())
					.invoke(newHomeBean, homeBean.getClass().getMethod(method.getName())
							.invoke(homeBean));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return newHomeBean;
	}

	@Override
	public void insertData(HomeBean homeBean) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteData(HomeBean homeBean) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateData(HomeBean homeBean) {
		// TODO Auto-generated method stub
		
	}
}
