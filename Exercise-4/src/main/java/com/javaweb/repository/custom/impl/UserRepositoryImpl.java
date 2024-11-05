package com.javaweb.repository.custom.impl;

import com.javaweb.entity.UserEntity;
import com.javaweb.repository.custom.UserRepositoryCustom;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.Collections;
import java.util.List;

@Repository
public class UserRepositoryImpl implements UserRepositoryCustom {
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<UserEntity> findByRole(String roleCode) {
		//JPQL
		String sql = "FROM UserEntity";
		Query query = entityManager.createNativeQuery(sql, UserEntity.class);
		return query.getResultList();
	}

	@Override
	public List<UserEntity> getAllUsers(Pageable pageable) {

		StringBuilder sql = new StringBuilder(buildQueryFilter())
				.append(" LIMIT ").append(pageable.getPageSize()).append("\n")
				.append(" OFFSET ").append(pageable.getOffset());
		System.out.println("Final query: " + sql.toString());

		Query query = entityManager.createNativeQuery(sql.toString(), UserEntity.class);
		return query.getResultList();
	}

	@Override
	public int countTotalItem() {
		String sql = buildQueryFilter();
		Query query = entityManager.createNativeQuery(sql.toString());
		return query.getResultList().size();
	}


	public void joinTable(StringBuilder sql) {
		sql.append(" INNER JOIN assignmentbuilding ON user.id = assignmentbuilding.staffid ");
		sql.append(" INNER JOIN building ON building.id = assignmentbuilding.buildingid ");
	}

	public void querySpecial(StringBuilder sql, Long id) {
		sql.append(" WHERE building.id = " + id + " ");
	}

	@Override
	public List<UserEntity> findByAssmentBuildingAndBuilding(Long buildingId) {
		StringBuilder sql = new StringBuilder(" SELECT DISTINCT * FROM user ");
		joinTable(sql);
		querySpecial(sql, buildingId);

		Query query = entityManager.createNativeQuery(sql.toString(), UserEntity.class);
		return query.getResultList();
	}

	private String buildQueryFilter() {
		String sql = "SELECT * FROM user u WHERE u.status = 1";
		return sql;
	}
}
