<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>课程表</title>
    <jsp:include page="common/head.jsp"/>
</head>
<body class="l-aside-left l-min">
<div id="index_87d1ccfce071f024bf1348bcfed03a9b"></div>
<!-- header -->
<jsp:include page="common/header.jsp"/>

<div id="react-body">
    <section class="inner-center clearfix">
        <aside class="aside-left">
            <div class="l-nav-area">
                <ul class="l-nav">
                    <li class="l-nav-item"><a title="课程表" href="courses" class="active" aria-current="page">课程表</a></li>
                    <li class="l-nav-item"><a title="全部订单" href="orders">全部订单</a></li>
                    <li class="l-nav-item"><a title="收藏" href="collections">收藏</a></li>
                    <li class="l-nav-item"><a title="个人信息" href="information">个人信息</a></li>
                </ul>
            </div>
        </aside>
        <main class="main">
            <div class="wrapper-plan"><h1 class="wrapper-tt">课程表</h1>
                <div>
                    <div class="tab-ctn">
                        <div class="tab-course-list clear-fix" id="my-courses">
                            <!-- 用户的课程列表 -->
                            <div class="tab-item-ctn active">
                                <p class="tab-title" title="redis数据库">redis数据库</p>
                            </div>
                            <div class="tab-item-ctn">
                                <p class="tab-title" title="JAVA高级开发 架构师课程（高并发 高可用 高扩展）【享学课堂】">JAVA高级开发 架构师课程（高并发 高可用
                                    高扩展）【享学课堂】</p>
                            </div>
                        </div>
                        <div class="tab-move-btn tab-next-btn"><span class="im-icon icon-font i-v-right"></span></div>
                    </div>
                    <div class="details-ctn">
                        <div class="term-ctn">
                            <div>班级：
                                <div class="current-term">redis数据库</div>
                            </div>
                        </div>
                        <div class="course-settings-ctn">
                            <div class="ctrl-item action-item before-line">
                                <div class="comments-ctn" title="点击发表您对本门课程的评价"><span
                                        class="im-icon icon-font i-comment"></span> 评价
                                </div>
                            </div>
                            <div class="ctrl-item action-item before-line"><a target="_blank"><span
                                    class="im-icon icon-font i-message"></span>联系老师</a></div>
                        </div>
                        <div>
                            <h2 class="sections-title">全部任务<span class="section-nums">(共4节)</span></h2>
                            <div class="detail-item-ctn">
                                <div class="detail-item-header">
                                    <div class="icon">
                                        <div class="process" data="1">
                                            <svg vesion="1.1" xmlns="http://www.w3.org/2000/svg"
                                                 style="width:100%;height:100%;">
                                                <ellipse cx="18" cy="18" rx="16" ry="16"
                                                         style="stroke-width:2px;stroke:#ade1fa;" stroke="#000"
                                                         fill="none"></ellipse>
                                                <path d="M18 2 A16 16 0 0 1 18 34 A16 16 0 0 1 17.999999999999996 2"
                                                      style="stroke-width:2px;stroke:#23b8ff;" stroke="#000"
                                                      fill="none"></path>
                                            </svg>
                                        </div>
                                        <div class="index">1</div>
                                    </div>
                                    <div class="section-title">redis安装、配置、数据类型</div>
                                </div>
                                <div class="detail-item-body" style="height: 0px;">
                                    <div class="task-item-ctn">
                                        <div class="icon">
                                            <div class="process" data="1">
                                                <svg vesion="1.1" xmlns="http://www.w3.org/2000/svg"
                                                     style="width:100%;height:100%;">
                                                    <ellipse cx="15" cy="15" rx="13" ry="13"
                                                             style="stroke-width:2px;stroke:#ade1fa;" stroke="#000"
                                                             fill="none"></ellipse>
                                                    <path d="M15 2 A13 13 0 0 1 15 28 A13 13 0 0 1 14.999999999999996 2"
                                                          style="stroke-width:2px;stroke:#23b8ff;" stroke="#000"
                                                          fill="none"></path>
                                                </svg>
                                            </div>
                                            <i><span class="im-icon icon-font i-record-border"></span></i></div>
                                        <div class="task-title">1 redis简介与安装</div>
                                        <div class="sub-title">19分钟</div>
                                        <div class="status-text"></div>
                                        <div class="task-button-ctn">
                                            <div class="task-btn info border"><span>看录播</span></div>
                                        </div>
                                    </div>
                                    <div class="task-item-ctn">
                                        <div class="icon">
                                            <div class="process" data="1">
                                                <svg vesion="1.1" xmlns="http://www.w3.org/2000/svg"
                                                     style="width:100%;height:100%;">
                                                    <ellipse cx="15" cy="15" rx="13" ry="13"
                                                             style="stroke-width:2px;stroke:#ade1fa;" stroke="#000"
                                                             fill="none"></ellipse>
                                                    <path d="M15 2 A13 13 0 0 1 15 28 A13 13 0 0 1 14.999999999999996 2"
                                                          style="stroke-width:2px;stroke:#23b8ff;" stroke="#000"
                                                          fill="none"></path>
                                                </svg>
                                            </div>
                                            <i><span class="im-icon icon-font i-record-border"></span></i></div>
                                        <div class="task-title">2redis的 配置</div>
                                        <div class="sub-title">25分钟</div>
                                        <div class="status-text"></div>
                                        <div class="task-button-ctn">
                                            <div class="task-btn info border"><span>看录播</span></div>
                                        </div>
                                    </div>
                                    <div class="task-item-ctn">
                                        <div class="icon">
                                            <div class="process" data="1">
                                                <svg vesion="1.1" xmlns="http://www.w3.org/2000/svg"
                                                     style="width:100%;height:100%;">
                                                    <ellipse cx="15" cy="15" rx="13" ry="13"
                                                             style="stroke-width:2px;stroke:#ade1fa;" stroke="#000"
                                                             fill="none"></ellipse>
                                                    <path d="M15 2 A13 13 0 0 1 15 28 A13 13 0 0 1 14.999999999999996 2"
                                                          style="stroke-width:2px;stroke:#23b8ff;" stroke="#000"
                                                          fill="none"></path>
                                                </svg>
                                            </div>
                                            <i><span class="im-icon icon-font i-record-border"></span></i></div>
                                        <div class="task-title">3 redis基本数据类型</div>
                                        <div class="sub-title">35分钟</div>
                                        <div class="status-text"></div>
                                        <div class="task-button-ctn">
                                            <div class="task-btn info border"><span>看录播</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="detail-item-ctn">
                                <div class="detail-item-header">
                                    <div class="icon">
                                        <div class="process" data="0.1746">
                                            <svg vesion="1.1" xmlns="http://www.w3.org/2000/svg"
                                                 style="width:100%;height:100%;">
                                                <ellipse cx="18" cy="18" rx="16" ry="16"
                                                         style="stroke-width:2px;stroke:#ade1fa;" stroke="#000"
                                                         fill="none"></ellipse>
                                                <path d="M18 2 A16 16 0 0 1 32.23780334038098 10.700345484844075"
                                                      style="stroke-width:2px;stroke:#23b8ff;" stroke="#000"
                                                      fill="none"></path>
                                            </svg>
                                        </div>
                                        <div class="index">2</div>
                                    </div>
                                    <div class="section-title">redis常用操作命令</div>
                                </div>
                                <div class="detail-item-body" style="height: 0px;">
                                    <div class="task-item-ctn">
                                        <div class="icon">
                                            <div class="process" data="0.6986">
                                                <svg vesion="1.1" xmlns="http://www.w3.org/2000/svg"
                                                     style="width:100%;height:100%;">
                                                    <ellipse cx="15" cy="15" rx="13" ry="13"
                                                             style="stroke-width:2px;stroke:#ade1fa;" stroke="#000"
                                                             fill="none"></ellipse>
                                                    <path d="M15 2 A13 13 0 0 1 15 28 A13 13 0 0 1 2.6720804889335508 19.125821194461434"
                                                          style="stroke-width:2px;stroke:#23b8ff;" stroke="#000"
                                                          fill="none"></path>
                                                </svg>
                                            </div>
                                            <i><span class="im-icon icon-font i-record-border"></span></i></div>
                                        <div class="task-title">1 redis对键的操作</div>
                                        <div class="sub-title">24分钟</div>
                                        <div class="status-text"></div>
                                        <div class="task-button-ctn">
                                            <div class="task-btn info border"><span>看录播</span></div>
                                        </div>
                                    </div>
                                    <div class="task-item-ctn">
                                        <div class="icon">
                                            <div class="process" data="0">
                                                <svg vesion="1.1" xmlns="http://www.w3.org/2000/svg"
                                                     style="width:100%;height:100%;">
                                                    <ellipse cx="15" cy="15" rx="13" ry="13"
                                                             style="stroke-width:2px;stroke:#ade1fa;" stroke="#000"
                                                             fill="none"></ellipse>
                                                    <path d="M15 2 A13 13 0 0 1 15 2"
                                                          style="stroke-width:2px;stroke:#23b8ff;" stroke="#000"
                                                          fill="none"></path>
                                                </svg>
                                            </div>
                                            <i><span class="im-icon icon-font i-record-border"></span></i></div>
                                        <div class="task-title">2redis对字符串操作</div>
                                        <div class="sub-title">20分钟</div>
                                        <div class="status-text"></div>
                                        <div class="task-button-ctn">
                                            <div class="task-btn info border"><span>看录播</span></div>
                                        </div>
                                    </div>
                                    <div class="task-item-ctn">
                                        <div class="icon">
                                            <div class="process" data="0">
                                                <svg vesion="1.1" xmlns="http://www.w3.org/2000/svg"
                                                     style="width:100%;height:100%;">
                                                    <ellipse cx="15" cy="15" rx="13" ry="13"
                                                             style="stroke-width:2px;stroke:#ade1fa;" stroke="#000"
                                                             fill="none"></ellipse>
                                                    <path d="M15 2 A13 13 0 0 1 15 2"
                                                          style="stroke-width:2px;stroke:#23b8ff;" stroke="#000"
                                                          fill="none"></path>
                                                </svg>
                                            </div>
                                            <i><span class="im-icon icon-font i-record-border"></span></i></div>
                                        <div class="task-title">3 redis对哈希表操作</div>
                                        <div class="sub-title">19分钟</div>
                                        <div class="status-text"></div>
                                        <div class="task-button-ctn">
                                            <div class="task-btn info border"><span>看录播</span></div>
                                        </div>
                                    </div>
                                    <div class="task-item-ctn">
                                        <div class="icon">
                                            <div class="process" data="0">
                                                <svg vesion="1.1" xmlns="http://www.w3.org/2000/svg"
                                                     style="width:100%;height:100%;">
                                                    <ellipse cx="15" cy="15" rx="13" ry="13"
                                                             style="stroke-width:2px;stroke:#ade1fa;" stroke="#000"
                                                             fill="none"></ellipse>
                                                    <path d="M15 2 A13 13 0 0 1 15 2"
                                                          style="stroke-width:2px;stroke:#23b8ff;" stroke="#000"
                                                          fill="none"></path>
                                                </svg>
                                            </div>
                                            <i><span class="im-icon icon-font i-record-border"></span></i></div>
                                        <div class="task-title">4 redis对列表操作</div>
                                        <div class="sub-title">19分钟</div>
                                        <div class="status-text"></div>
                                        <div class="task-button-ctn">
                                            <div class="task-btn info border"><span>看录播</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="detail-item-ctn">
                                <div class="detail-item-header">
                                    <div class="icon">
                                        <div class="process" data="0">
                                            <svg vesion="1.1" xmlns="http://www.w3.org/2000/svg"
                                                 style="width:100%;height:100%;">
                                                <ellipse cx="18" cy="18" rx="16" ry="16"
                                                         style="stroke-width:2px;stroke:#ade1fa;" stroke="#000"
                                                         fill="none"></ellipse>
                                                <path d="M18 2 A16 16 0 0 1 18 2"
                                                      style="stroke-width:2px;stroke:#23b8ff;" stroke="#000"
                                                      fill="none"></path>
                                            </svg>
                                        </div>
                                        <div class="index">3</div>
                                    </div>
                                    <div class="section-title">redis高级应用</div>
                                </div>
                                <div class="detail-item-body" style="height: 0px;">
                                    <div class="task-item-ctn">
                                        <div class="icon">
                                            <div class="process" data="0">
                                                <svg vesion="1.1" xmlns="http://www.w3.org/2000/svg"
                                                     style="width:100%;height:100%;">
                                                    <ellipse cx="15" cy="15" rx="13" ry="13"
                                                             style="stroke-width:2px;stroke:#ade1fa;" stroke="#000"
                                                             fill="none"></ellipse>
                                                    <path d="M15 2 A13 13 0 0 1 15 2"
                                                          style="stroke-width:2px;stroke:#23b8ff;" stroke="#000"
                                                          fill="none"></path>
                                                </svg>
                                            </div>
                                            <i><span class="im-icon icon-font i-record-border"></span></i></div>
                                        <div class="task-title">1 redis命令-set集合操作</div>
                                        <div class="sub-title">23分钟</div>
                                        <div class="status-text"></div>
                                        <div class="task-button-ctn">
                                            <div class="task-btn info border"><span>看录播</span></div>
                                        </div>
                                    </div>
                                    <div class="task-item-ctn">
                                        <div class="icon">
                                            <div class="process" data="0">
                                                <svg vesion="1.1" xmlns="http://www.w3.org/2000/svg"
                                                     style="width:100%;height:100%;">
                                                    <ellipse cx="15" cy="15" rx="13" ry="13"
                                                             style="stroke-width:2px;stroke:#ade1fa;" stroke="#000"
                                                             fill="none"></ellipse>
                                                    <path d="M15 2 A13 13 0 0 1 15 2"
                                                          style="stroke-width:2px;stroke:#23b8ff;" stroke="#000"
                                                          fill="none"></path>
                                                </svg>
                                            </div>
                                            <i><span class="im-icon icon-font i-record-border"></span></i></div>
                                        <div class="task-title">2redis命令-有序集合操作</div>
                                        <div class="sub-title">19分钟</div>
                                        <div class="status-text"></div>
                                        <div class="task-button-ctn">
                                            <div class="task-btn info border"><span>看录播</span></div>
                                        </div>
                                    </div>
                                    <div class="task-item-ctn">
                                        <div class="icon">
                                            <div class="process" data="0">
                                                <svg vesion="1.1" xmlns="http://www.w3.org/2000/svg"
                                                     style="width:100%;height:100%;">
                                                    <ellipse cx="15" cy="15" rx="13" ry="13"
                                                             style="stroke-width:2px;stroke:#ade1fa;" stroke="#000"
                                                             fill="none"></ellipse>
                                                    <path d="M15 2 A13 13 0 0 1 15 2"
                                                          style="stroke-width:2px;stroke:#23b8ff;" stroke="#000"
                                                          fill="none"></path>
                                                </svg>
                                            </div>
                                            <i><span class="im-icon icon-font i-record-border"></span></i></div>
                                        <div class="task-title">3 HyperLogLog基数估算</div>
                                        <div class="sub-title">9分钟</div>
                                        <div class="status-text"></div>
                                        <div class="task-button-ctn">
                                            <div class="task-btn info border"><span>看录播</span></div>
                                        </div>
                                    </div>
                                    <div class="task-item-ctn">
                                        <div class="icon">
                                            <div class="process" data="0">
                                                <svg vesion="1.1" xmlns="http://www.w3.org/2000/svg"
                                                     style="width:100%;height:100%;">
                                                    <ellipse cx="15" cy="15" rx="13" ry="13"
                                                             style="stroke-width:2px;stroke:#ade1fa;" stroke="#000"
                                                             fill="none"></ellipse>
                                                    <path d="M15 2 A13 13 0 0 1 15 2"
                                                          style="stroke-width:2px;stroke:#23b8ff;" stroke="#000"
                                                          fill="none"></path>
                                                </svg>
                                            </div>
                                            <i><span class="im-icon icon-font i-record-border"></span></i></div>
                                        <div class="task-title">4 redis订阅与发布</div>
                                        <div class="sub-title">16分钟</div>
                                        <div class="status-text"></div>
                                        <div class="task-button-ctn">
                                            <div class="task-btn info border"><span>看录播</span></div>
                                        </div>
                                    </div>
                                    <div class="task-item-ctn">
                                        <div class="icon">
                                            <div class="process" data="0">
                                                <svg vesion="1.1" xmlns="http://www.w3.org/2000/svg"
                                                     style="width:100%;height:100%;">
                                                    <ellipse cx="15" cy="15" rx="13" ry="13"
                                                             style="stroke-width:2px;stroke:#ade1fa;" stroke="#000"
                                                             fill="none"></ellipse>
                                                    <path d="M15 2 A13 13 0 0 1 15 2"
                                                          style="stroke-width:2px;stroke:#23b8ff;" stroke="#000"
                                                          fill="none"></path>
                                                </svg>
                                            </div>
                                            <i><span class="im-icon icon-font i-record-border"></span></i></div>
                                        <div class="task-title">5 redis中的事务</div>
                                        <div class="sub-title">9分钟</div>
                                        <div class="status-text"></div>
                                        <div class="task-button-ctn">
                                            <div class="task-btn info border"><span>看录播</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="detail-item-ctn">
                                <div class="detail-item-header">
                                    <div class="icon">
                                        <div class="process" data="0">
                                            <svg vesion="1.1" xmlns="http://www.w3.org/2000/svg"
                                                 style="width:100%;height:100%;">
                                                <ellipse cx="18" cy="18" rx="16" ry="16"
                                                         style="stroke-width:2px;stroke:#ade1fa;" stroke="#000"
                                                         fill="none"></ellipse>
                                                <path d="M18 2 A16 16 0 0 1 18 2"
                                                      style="stroke-width:2px;stroke:#23b8ff;" stroke="#000"
                                                      fill="none"></path>
                                            </svg>
                                        </div>
                                        <div class="index">4</div>
                                    </div>
                                    <div class="section-title">redis在Java中的应用</div>
                                </div>
                                <div class="detail-item-body" style="height: 0px;">
                                    <div class="task-item-ctn">
                                        <div class="icon">
                                            <div class="process" data="0">
                                                <svg vesion="1.1" xmlns="http://www.w3.org/2000/svg"
                                                     style="width:100%;height:100%;">
                                                    <ellipse cx="15" cy="15" rx="13" ry="13"
                                                             style="stroke-width:2px;stroke:#ade1fa;" stroke="#000"
                                                             fill="none"></ellipse>
                                                    <path d="M15 2 A13 13 0 0 1 15 2"
                                                          style="stroke-width:2px;stroke:#23b8ff;" stroke="#000"
                                                          fill="none"></path>
                                                </svg>
                                            </div>
                                            <i><span class="im-icon icon-font i-record-border"></span></i></div>
                                        <div class="task-title">1 redis服务器管理</div>
                                        <div class="sub-title">34分钟</div>
                                        <div class="status-text"></div>
                                        <div class="task-button-ctn">
                                            <div class="task-btn info border"><span>看录播</span></div>
                                        </div>
                                    </div>
                                    <div class="task-item-ctn">
                                        <div class="icon">
                                            <div class="process" data="0">
                                                <svg vesion="1.1" xmlns="http://www.w3.org/2000/svg"
                                                     style="width:100%;height:100%;">
                                                    <ellipse cx="15" cy="15" rx="13" ry="13"
                                                             style="stroke-width:2px;stroke:#ade1fa;" stroke="#000"
                                                             fill="none"></ellipse>
                                                    <path d="M15 2 A13 13 0 0 1 15 2"
                                                          style="stroke-width:2px;stroke:#23b8ff;" stroke="#000"
                                                          fill="none"></path>
                                                </svg>
                                            </div>
                                            <i><span class="im-icon icon-font i-record-border"></span></i></div>
                                        <div class="task-title">2 redis安全设置</div>
                                        <div class="sub-title">15分钟</div>
                                        <div class="status-text"></div>
                                        <div class="task-button-ctn">
                                            <div class="task-btn info border"><span>看录播</span></div>
                                        </div>
                                    </div>
                                    <div class="task-item-ctn">
                                        <div class="icon">
                                            <div class="process" data="0">
                                                <svg vesion="1.1" xmlns="http://www.w3.org/2000/svg"
                                                     style="width:100%;height:100%;">
                                                    <ellipse cx="15" cy="15" rx="13" ry="13"
                                                             style="stroke-width:2px;stroke:#ade1fa;" stroke="#000"
                                                             fill="none"></ellipse>
                                                    <path d="M15 2 A13 13 0 0 1 15 2"
                                                          style="stroke-width:2px;stroke:#23b8ff;" stroke="#000"
                                                          fill="none"></path>
                                                </svg>
                                            </div>
                                            <i><span class="im-icon icon-font i-record-border"></span></i></div>
                                        <div class="task-title">3 java中使用redis</div>
                                        <div class="sub-title">30分钟</div>
                                        <div class="status-text"></div>
                                        <div class="task-button-ctn">
                                            <div class="task-btn info border"><span>看录播</span></div>
                                        </div>
                                    </div>
                                    <div class="task-item-ctn">
                                        <div class="icon">
                                            <div class="process" data="0">
                                                <svg vesion="1.1" xmlns="http://www.w3.org/2000/svg"
                                                     style="width:100%;height:100%;">
                                                    <ellipse cx="15" cy="15" rx="13" ry="13"
                                                             style="stroke-width:2px;stroke:#ade1fa;" stroke="#000"
                                                             fill="none"></ellipse>
                                                    <path d="M15 2 A13 13 0 0 1 15 2"
                                                          style="stroke-width:2px;stroke:#23b8ff;" stroke="#000"
                                                          fill="none"></path>
                                                </svg>
                                            </div>
                                            <i><span class="im-icon icon-font i-record-border"></span></i></div>
                                        <div class="task-title">4 redis工具类,连接池的使用</div>
                                        <div class="sub-title">21分钟</div>
                                        <div class="status-text"></div>
                                        <div class="task-button-ctn">
                                            <div class="task-btn info border"><span>看录播</span></div>
                                        </div>
                                    </div>
                                    <div class="task-item-ctn">
                                        <div class="icon">
                                            <div class="process" data="0">
                                                <svg vesion="1.1" xmlns="http://www.w3.org/2000/svg"
                                                     style="width:100%;height:100%;">
                                                    <ellipse cx="15" cy="15" rx="13" ry="13"
                                                             style="stroke-width:2px;stroke:#ade1fa;" stroke="#000"
                                                             fill="none"></ellipse>
                                                    <path d="M15 2 A13 13 0 0 1 15 2"
                                                          style="stroke-width:2px;stroke:#23b8ff;" stroke="#000"
                                                          fill="none"></path>
                                                </svg>
                                            </div>
                                            <i><span class="im-icon icon-font i-record-border"></span></i></div>
                                        <div class="task-title">5 redis在java中的其他示例</div>
                                        <div class="sub-title">33分钟</div>
                                        <div class="status-text"></div>
                                        <div class="task-button-ctn">
                                            <div class="task-btn info border"><span>看录播</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </section>
    <!-- footer -->
    <jsp:include page="common/footer.jsp"/>
</div>
</body>
</html>
