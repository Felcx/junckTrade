package com.lichao.bean;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.lichao.entity.BaseEntity;
import com.lichao.utill.FelcxTool;

import freemarker.template.utility.StringUtil;

/**
 * A data access object (DAO) providing persistence and search support for Goods
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.lichao.bean.Goods
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class GoodsDAO {
	private static final Logger log = LoggerFactory.getLogger(GoodsDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String TIME_CAN_USER = "timeCanUser";
	public static final String PRICE = "price";
	public static final String PRICE_NEW = "priceNew";
	public static final String DESCRIPTION = "description";
	public static final String STATE = "state";
	public static final String RANGE_OLD = "rangeOld";
	public static final String CLASS_ = "class_";
	public static final String GOODSCOL = "goodscol";

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	protected void initDao() {
		// do nothing
	}

	public void save(Goods transientInstance) {
		log.debug("saving Goods instance");
		try {
			getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Goods persistentInstance) {
		log.debug("deleting Goods instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Goods findById(java.lang.Integer id) {
		log.debug("getting Goods instance with id: " + id);
		try {
			Goods instance = (Goods) getCurrentSession().get("com.lichao.bean.Goods", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Goods instance) {
		log.debug("finding Goods instance by example");
		try {
			List results = getCurrentSession().createCriteria("com.lichao.bean.Goods").add(Example.create(instance))
					.list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Goods instance with property: " + propertyName + ", value: " + value);
		try {
			String queryString = "from Goods as model where model." + propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findByTimeCanUser(Object timeCanUser) {
		return findByProperty(TIME_CAN_USER, timeCanUser);
	}

	public List findByPrice(Object price) {
		return findByProperty(PRICE, price);
	}

	public List findByPriceNew(Object priceNew) {
		return findByProperty(PRICE_NEW, priceNew);
	}

	public List findByDescription(Object description) {
		return findByProperty(DESCRIPTION, description);
	}

	public List findByState(Object state) {
		return findByProperty(STATE, state);
	}

	public List findByRangeOld(Object rangeOld) {
		return findByProperty(RANGE_OLD, rangeOld);
	}

	public List findByClass_(Object class_) {
		return findByProperty(CLASS_, class_);
	}

	public List findByGoodscol(Object goodscol) {
		return findByProperty(GOODSCOL, goodscol);
	}

	public List findAll() {
		log.debug("finding all Goods instances");
		try {
			String queryString = "from Goods";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Goods merge(Goods detachedInstance) {
		log.debug("merging Goods instance");
		try {
			Goods result = (Goods) getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Goods instance) {
		log.debug("attaching dirty Goods instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Goods instance) {
		log.debug("attaching clean Goods instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static GoodsDAO getFromApplicationContext(ApplicationContext ctx) {
		return (GoodsDAO) ctx.getBean("GoodsDAO");
	}
	
	public BaseEntity<Object> search(int pageNo,int pageSize,String name,String userName,double price,int typeid,
			int state,int userId,int buyerId){
		BaseEntity<Object> pager = new BaseEntity<Object>();
		try
		{
			Criteria criteria = getCurrentSession().createCriteria(Goods.class);
			criteria.add(Restrictions.isNotNull("priceNew"));
            if(FelcxTool.isNotEmpty(name)){
            	criteria.add(Restrictions.like("name",name,MatchMode.ANYWHERE));
            }
            if(price>=0){
            	criteria.add(Restrictions.le("priceNew", price));
            }
            if(state!=-1){
            	criteria.add(Restrictions.le("state", state));
            }
			if(typeid!=-1){
				criteria.createCriteria("types")
		        .add(Restrictions.eq("id", typeid));
			}
			if(FelcxTool.isNotEmpty(userName)){
				criteria.createCriteria("userByIdOwner")
				        .add(Restrictions.like("name", userName, MatchMode.ANYWHERE));
				
			}
			if(userId!=-1){
				criteria.createCriteria("userByIdOwner")
		        .add(Restrictions.eq("id", userId));
			}
			if(buyerId!=-1){
				criteria.createCriteria("userByIdBuyer")
		        .add(Restrictions.eq("id", buyerId));
			}
			// 获取根据条件分页查询的总行数
			long rowCount = (long) criteria.setProjection(
					Projections.rowCount()).uniqueResult();
			criteria.setProjection(null);

			criteria.setFirstResult((pageNo - 1) * pageSize);
			criteria.setMaxResults(pageSize);

			List result = criteria.list();
			pager.setCount(result.size());
			pager.setDataset(result);
			pager.setTotalCount(rowCount+"");


		} catch (RuntimeException re)
		{
			throw re;
		} finally
		{
			return pager;
		}
	}
	
	public List findBySize(int pageNo,int pageSize){
		try {
			Query queryObject = getCurrentSession().createQuery("from Goods ");
			queryObject.setFirstResult(pageNo*pageSize);
			queryObject.setMaxResults(pageSize);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
}