package freeboard;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class DataSourceTest {

	private static final Logger logger = LoggerFactory.getLogger(DataSourceTest.class);

	@Inject
	private DataSource ds;

	@Test
	public void testConnection() throws Exception {
		try (Connection conn = ds.getConnection()) {
			
			logger.info("연결성공 : " + conn);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
