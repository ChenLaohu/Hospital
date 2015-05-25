<%@ Page Language="C#" MasterPageFile="~/Share.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Hospital._Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <link rel="stylesheet" href="css/index.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<nav>
			<div id="left">
				<div class="part1">
					<div class="part1_Name">手术视频</div>
					<div class="part1_left">
					<%for(int i=0;i<list1.Count;i++) {%>
					<%
                              string imgUrl = "";
                              if (!Convert.IsDBNull(list1[i].imgPath) && list1[i].imgPath != null)
                                  imgUrl += list1[i].imgPath.Replace(@"D:\Hopital","");
                                         %>
						<a href="detail.aspx?tableid=<%=list2[i].TableID %>">
							<img src="<%=imgUrl %>" width="370" height="321" />
							<div class="img_text"><%=list1[i].Title %></div>
						</a>
						<%} %>
					</div>
					<div class="part1_right">
                        <%for(int i=0;i<list2.Count;i++) {%>
						<a class="video" href="detail.aspx?tableid=<%=list2[i].TableID %> ">
							<div class="video_content">
								<div class="video_content_img">
                                    <%
                              string imgUrl = "";
                              string title = "";
                              if (!Convert.IsDBNull(list2[i].imgPath) && list2[i].imgPath != null)
                                  imgUrl += list2[i].imgPath.ToString().Replace(@"D:\Hopital", "");
                              else
                                  imgUrl += "/UpFiles/Tables/sy_73107821932.jpg";
                              if (list2[i].Title.Length >= 8)
                                  title = list2[i].Title.ToString().Substring(0, 8) + "..";
                              else
                                  title = list2[i].Title;
                                         %>
                                    <img src="<%=imgUrl %>" width="175" height="100" />

								</div>
								<div class="video_content_img_title"><%=title %></div>
								<div class="video_content_img_title_double"><%=title %></div>
								<div class="video_content_img_title_double count"><%=list2[i].CreateTime.ToString("yyyy-MM-dd") %></div>
							</div>
						</a>
                        <%} %>
					</div>
				</div>
				
				<!--结束左边第一部分-->
					<div class="part1 module">
					<div class="part1_Name" style="height:30px;"></div>
					  <%for(int i=0;i<list2.Count;i++) {%>
						<a class="video" href="detail.aspx?tableid=<%=list2[i].TableID %>">
							<div class="video_content">
								<div class="video_content_img">
                                    <%
                              string imgUrl = "";
                              if (!Convert.IsDBNull(list2[i].imgPath) && list2[i].imgPath != null)
                                  imgUrl += list2[i].imgPath.ToString().Replace(@"D:\Hopital", "");
                              else
                                  imgUrl += "/UpFiles/Tables/sy_73107821932.jpg";
                              string title = "";
                              if (list2[i].Title.Length >= 8)
                                  title = list2[i].Title.ToString().Substring(0, 8) + "..";
                              else
                                  title = list2[i].Title;
                                         %>
                                    <img src="<%=imgUrl %>" width="175" height="100" />

								</div>
								<div class="video_content_img_title"><%=title %></div>
								<div class="video_content_img_title_double"><%=title %></div>
								<div class="video_content_img_title_double count"><%=list2[i].CreateTime.ToString("yyyy-MM-dd") %></div>
							</div>
						</a>
                        <%} %>
				</div>
				<!--结束第二部分-->
				<div class="part1 module three"><a href="#"><img src="images/26.png" width="955" height="80" /></a></div>
				
				<!--结束第三部分-->
				<div class="part1">
					<div class="part1_Name">医学视频</div>
					<div class="part1_left">
						<%for(int i=0;i<list1.Count;i++) {%>
					<%
                              string imgUrl = "";
                              if (!Convert.IsDBNull(list1[i].imgPath) && list1[i].imgPath != null)
                                  imgUrl += list1[i].imgPath.ToString().Replace(@"D:\Hopital", "");
                                         %>
						<a href="detail.aspx?tableid=<%=list1[i].TableID %>">
							<img src="<%=imgUrl %>" width="370" height="321" />
							<div class="img_text"><%=list1[i].Title %></div>
						</a>
						<%} %>
						
					</div>
					<div class="part1_right">
						 <%for(int i=0;i<list2.Count;i++) {%>
						<a class="video" href="detail.aspx?tableid=<%=list2[i].TableID %>">
							<div class="video_content">
								<div class="video_content_img">
                                    <%
                              string imgUrl = "";
                              if (!Convert.IsDBNull(list2[i].imgPath) && list2[i].imgPath != null)
                                  imgUrl += list2[i].imgPath.ToString().Replace(@"D:\Hopital", "");
                              else
                                  imgUrl += "/UpFiles/Tables/sy_73107821932.jpg";
                              string title = "";
                              if (list2[i].Title.Length >= 8)
                                  title = list2[i].Title.ToString().Substring(0, 8) + "..";
                              else
                                  title = list2[i].Title;
                                         %>
                                    <img src="<%=imgUrl %>" width="175" height="100" />

								</div>
								<div class="video_content_img_title"><%=title %></div>
								<div class="video_content_img_title_double"><%=title %></div>
								<div class="video_content_img_title_double count"><%=list2[i].CreateTime.ToString("yyyy-MM-dd") %></div>
							</div>
						</a>
                        <%} %>
					</div>
				</div>
				
				
				<!--结束第四部分-->
			</div>
			<!--结束 nav left-->
			<div id="right">
				<div id="ranking">
					<div class="part1_Name name">热门视频</div>
					<div id="one">
					<%for(int i=0;i<list1.Count;i++) {%>
						 <%
                              string imgUrl = "";
                              if (!Convert.IsDBNull(list1[i].imgPath) && list1[i].imgPath != null)
                                  imgUrl += list1[i].imgPath.ToString().Replace(@"D:\Hopital", "");
                              else
                                  imgUrl += "/UpFiles/Tables/sy_73107821932.jpg";
                                         %>
						<a href="detail.aspx?tableid=<%=list1[i].TableID %>">
							<div class="video_content new">
								<div class="video_content_img"><img src="<%=imgUrl %>" width="265" height="180" /></div>
								<div class="video_content_img_title title"><%=list1[i].Title %></div>
							</div>
						</a>
					<%} %>
					</div>
				<!--排第一-->
				<%for(int i=0;i<list2.Count;i++) {%>
				<%
                              string imgUrl = "";
                              if (!Convert.IsDBNull(list2[i].imgPath) && list2[i].imgPath != null)
                                  imgUrl += list2[i].imgPath.ToString().Replace(@"D:\Hopital", "");
                              else
                                  imgUrl += "/UpFiles/Tables/sy_73107821932.jpg";
                              string title = "";
                              if (list2[i].Title.Length >= 8)
                                  title = list2[i].Title.ToString().Substring(0, 8) + "..";
                              else
                                  title = list2[i].Title;
                                         %>
					<a class="ranking_list" href="detail.aspx?tableid=<%=list2[i].TableID %>">
						<div class="list_img"><img src="<%=imgUrl %>" width="40" height="40"/></div>
						<div class="list_content" href="#">
							<div class="list_content_bt"><%=title%></div>
							<div class="list_content_time">
								<div class="list_content_time_r"><%=list2[i].userName %></div>
								<div class="list_content_time_r countNew"><%=list2[i].CreateTime.ToString("yyyy-MM-dd") %></div>
							</div>
						</div>
					</a>
				<%} %>
					<!--排以下-->
				</div>
				<!--rihgt_part1-->
				<div id="ranking" class="rightNew">
					<div class="part1_Name name">医生之声</div>
				<%for(int i=0;i<list2.Count;i++) {%>
				<%
                              string imgUrl = "";
                              if (!Convert.IsDBNull(list2[i].imgPath) && list2[i].imgPath != null)
                                  imgUrl += list2[i].imgPath.ToString().Replace(@"D:\Hopital", "");
                              else
                                  imgUrl += "/UpFiles/Tables/sy_73107821932.jpg";
                              string title = "";
                              if (list2[i].Title.Length >= 8)
                                  title = list2[i].Title.ToString().Substring(0, 8) + "..";
                              else
                                  title = list2[i].Title;
                                         %>
					<a class="ranking_list listNew" href="detail.aspx?tableid=<%=list2[i].TableID %>">
						<div class="list_img"><img src="<%=imgUrl %>" width="65" height="65"/></div>
						<div class="list_content" href="#">
							<div class="list_content_bt btNew"><%=title %></div>
							<div class="list_content_bt time">时间：<%=list2[i].CreateTime.ToString("yyyy-MM-dd") %></div>
							<div class="list_content_time">
								<div class="list_content_time_r"><%=list2[i].userName %></div>
								<div class="list_content_time_r countNew"></div>
							</div>
						</div>
					</a>
					<%} %>
					<!--排以下-->
					
					
			
				</div>
				<!--right_part2-->
				
			
				<!--right_part3-->
				
			</div>
		</nav>
</asp:Content>
