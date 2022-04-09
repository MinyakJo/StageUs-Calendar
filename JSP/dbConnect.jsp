<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
    request.setCharacterEncoding("utf-8");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/stageUsDB",
        "StageUs",
        "1234"
    );

    String sql = "";
    PreparedStatement query = null;
    
    ResultSet result = null;

    ArrayList<String> userIdList = new ArrayList<String>();
    ArrayList<String> userNameList = new ArrayList<String>();
    ArrayList<String> userEmailList = new ArrayList<String>();
    ArrayList<String> userRankList = new ArrayList<String>();
    ArrayList<String> userDeptList = new ArrayList<String>();
    ArrayList<String> calendarDateList = new ArrayList<String>();
    ArrayList<String> calendarContentList = new ArrayList<String>();
    ArrayList<String> deptList = new ArrayList<String>();

    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd / HH:mm");
    Timestamp now = new Timestamp(System.currentTimeMillis() + (60 * 60 * 9000)); // 9시간 더하기
%>