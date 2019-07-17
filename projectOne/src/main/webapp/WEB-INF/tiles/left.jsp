<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="main-sidebar">
    <!-- Inner sidebar -->
    <div class="sidebar">
      <!-- user panel (Optional) -->
      <sec:authorize access="isAuthenticated()">
      <sec:authentication var="user" property="principal"/>
      <div class="user-panel">
        <div class="pull-left image">
          <img src="../resources/AdminLTE/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${user.username}</p>

          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div><!-- /.user-panel -->
			</sec:authorize>
      <!-- Search Form (Optional) -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
            <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
          </span>
        </div>
      </form><!-- /.sidebar-form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu">
        <li class="header">메인메뉴</li>
        <!-- Optionally, you can add icons to the links -->
        <li class="active"><a href="#"><span>Link</span></a><</li>
        <li><a href="#"><span>Another Link</span></a></li>
        <li class="treeview">
          <a href="#"><span>Multilevel</span> <i class="fa fa-angle-left pull-right"></i></a>
          <ul class="treeview-menu">
            <li><a href="#">Link in level 2</a></li>
            <li><a href="#">Link in level 2</a></li>
          </ul>
        </li>
      </ul><!-- /.sidebar-menu -->

    </div><!-- /.sidebar -->
  </div><!-- /.main-sidebar -->
<script type="text/javascript">
    $(function() {
 
    });    
</script>
