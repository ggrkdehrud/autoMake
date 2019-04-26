package set.set.set.serviceImpl;

import java.lang.reflect.Method;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import set.set.set.bean.HomeBean;
import set.set.set.dao.HomeDao;
import set.set.set.service.HomeService;

@Service("HomeService")
public class HomeServiceImpl implements HomeService{
	
	@Resource(name="HomeDao")
	private HomeDao homeDao;
	
	@Override
	public ArrayList<HomeBean> readAllData() {
		return homeDao.readAllData();
	}
	
	@Override
	public HomeBean readData(String primaryKey) {
		return homeDao.readData(primaryKey);
	}

	@Override
	public void insertData(HomeBean homeBean) {
		homeDao.insertData(homeBean);
	}

	@Override
	public void deleteData(HomeBean homeBean) {
		homeDao.deleteData(homeBean);
	}

	@Override
	public void updateData(HomeBean homeBean) {
		homeDao.updateData(homeBean);
	}
}
