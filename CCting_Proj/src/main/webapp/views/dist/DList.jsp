
<%@page import="model.DistDTO"%>
<%@page import="model.PageData"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

// PageData : model_p 패키지에 만들어준 클래스임
PageData pd = (PageData)request.getAttribute("pd");
int i = pd.start;
for(DistDTO dto : (ArrayList<DistDTO>) request.getAttribute("mainData")) {
i++;
%>	
	<div>
		<p><%=i %></p>
		<p >
		<% for(int n=0; n<dto.getLev(); n++) { %>
				&nbsp;&nbsp;
		<% } if(dto.getLev()>0) { %>
		└
		<% } %>
			<a href="Ddetail?did=<%=dto.getDid()%>&page=<%=pd.page %>"><%=dto.getDtitle() %></a>
		</p>
		<p><%=dto.getDname() %></p>
		<p><%=dto.getReg_datestr() %></p>
		<p><%=dto.getCnt() %></p>
	</div>
	<%} %>
	<div>
		<p >
		<% if(pd.pageStart > 1) { %>
			<a href="?page=<%=pd.pageStart-1%>">[이전]</a>
		<% } for(int p = pd.pageStart; p <= pd.pageEnd; p++) { 
			if(pd.page == p) {%>
			[<%=p %>]
		<% } else { %>
				<a href = "?page=<%=p %>"><%=p %></a>
		<% }} if (pd.pageEnd < pd.pageTotal) { %>
			<a href="?page=<%=pd.pageEnd+1%>">[다음]</a>
		<% } %>
		</p>
		
	</div>
	<div>
		<p>
			<a href="DwriteForm">글쓰기</a>
		</p>
	</div>
