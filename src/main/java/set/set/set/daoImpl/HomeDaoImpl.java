package set.set.set.daoImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import set.set.set.bean.HomeBean;
import set.set.set.dao.AbstractDao;
import set.set.set.dao.HomeDao;

@Repository("HomeDao")
public class HomeDaoImpl extends AbstractDao implements HomeDao {
	
	@Override
	public ArrayList<HomeBean> readAllData() {
		
		
		List<Map<String, Object>> aa = (List<Map<String, Object>>)selectList("autoMake.readAllData");
		for(int i = 0; i < aa.size(); i++) {
			System.out.println(aa.get(i).get("ID"));
			System.out.println(aa.get(i).get("TITLE"));
			System.out.println(aa.get(i).get("CONTENT"));
		}
		
		return null;
	}
	
	@Override
	public HomeBean readData(String primaryKey) {
		// TODO Auto-generated method stub
		return null;
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
