
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>


			<ul>
				<c:forEach var = "task" items = "${tasks}">
					<li>${task.task_name}</li>
				</c:forEach>
			</ul>

   
</t:template>
</html>