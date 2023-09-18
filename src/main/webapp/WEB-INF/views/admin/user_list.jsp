<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>전체회원조회</title>
	<link rel='stylesheet' href='/resources/css/admin/memberList.css'>
    <script src='https://unpkg.com/vue@2.5.17/dist/vue.js'></script>
	</head>
	<body>
<header style="text-align: center;">
    <br><br>
    <h1>헤더</h1>
  </header>
  <hr>
  <br><br><br><br>

    <div id="boardTable" class="board-list">
        <div class="filter input-group mb-3">
        <input class="form-control" type="text" placeholder="검색"
                                        v-model="filter_name" />
                                </div>
        <table class="table table-borderd  table-fixed">
            <thead>
            <tr>
                <th>#</th>
                <th>제목</th>
                <th>작성자</th>
                <th>조회수</th>
                <th>작성일</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="(r, index) in filteredRows.slice(pageStart, pageStart + countOfPage)">
                <th class="no">{{ r.no }}</th>
                <td><a href="#" class="title">{{ r.subject }}</a></td>
                <td class="created">{{ r.created }}</td>
                <td class="hit">{{ r.hit }}</td>
                <td class="date">{{ r.date }}</td>
            </tr>
            </tbody>
        </table>
        <nav aria-label="Page navigation example">
            <div class="current-page-area">
            <!-- Viewing 1 - 5 of {{total}} items -->
          </div>
            <ul class="pagination justify-content-center">
            <li class="page-item" v-bind:class="{'disabled': (currPage === 1)}" @click.prevent="setPage(currPage-1)"><a class="page-link"
                                            href="">Prev</a></li>
            <li class="page-item" v-for="n in totalPage" v-bind:class="{'active': (currPage === (n))}" @click.prevent="setPage(n)"><a class="page-link" href="">{{n}}</a></li>
            <li class="page-item" v-bind:class="{'disabled': (currPage === totalPage)}" @click.prevent="setPage(currPage+1)"><a class="page-link"
                                            href="">Next</a></li>
            </ul>
        </nav>
        </div>


        <br><br><br><br>
        <hr>
        <footer style="text-align: center;">  
            <h1>푸터</h1>
        </footer>
    
        <script>
            var data = [{
          "no": "10",
          "subject": "10서비스 구축 서비스 구축 서비스 구축 서비스 구축",
          "created": "홍길동홍길동",
          "hit": "1000",
          "date": "2018.12.10 17:30:19"
        },
        {
          "no": "9",
          "subject": "9서비스 구축 서비스 구축 서비스 구축 서비스 구축",
          "created": "홍길동홍길동",
          "hit": "1000",
          "date": "2018.12.10 17:30:19"
        },
        {
          "no": "8",
          "subject": "8서비스 구축 서비스 구축 서비스 구축 서비스 구축",
          "created": "홍길동홍길동",
          "hit": "1000",
          "date": "2018.12.10 17:30:19"
        },
        {
          "no": "7",
          "subject": "7서비스 구축 서비스 구축 서비스 구축 서비스 구축",
          "created": "홍길동홍길동",
          "hit": "1000",
          "date": "2018.12.10 17:30:19"
        },
        {
          "no": "6",
          "subject": "6서비스 구축 서비스 구축 서비스 구축 서비스 구축",
          "created": "홍길동홍길동",
          "hit": "1000",
          "date": "2018.12.10 17:30:19"
        },
        {
          "no": "5",
          "subject": "5서비스 구축 서비스 구축 서비스 구축 서비스 구축",
          "created": "홍길동홍길동",
          "hit": "1000",
          "date": "2018.12.10 17:30:19"
        },
        {
          "no": "4",
          "subject": "4서비스 구축 서비스 구축 서비스 구축 서비스 구축",
          "created": "홍길동홍길동",
          "hit": "1000",
          "date": "2018.12.10 17:30:19"
        },
        {
          "no": "3",
          "subject": "3서비스 구축 서비스 구축 서비스 구축 서비스 구축",
          "created": "홍길동홍길동",
          "hit": "1000",
          "date": "2018.12.10 17:30:19"
        },
        {
          "no": "2",
          "subject": "2서비스 구축 서비스 구축 서비스 구축 서비스 구축",
          "created": "홍길동홍길동",
          "hit": "1000",
          "date": "2018.12.10 17:30:19"
        },
        {
          "no": "1",
          "subject": "1서비스 구축",
          "created": "홍길동",
          "hit": "11",
          "date": "2018.12.03 17:30:19"
        }
      ]
      var app = new Vue({
        el: '#boardTable',
        data: {
          rows: data,
          countOfPage: 5,
          currPage: 1,
          total: 10,
          filter_name: ''
        },
        computed: {
          filteredRows: function() {
            var filter_name = this.filter_name.toLowerCase();

            return this.filter_name.trim() !== '' ?
              this.rows.filter(function(d) {
                return d.subject.toLowerCase().indexOf(filter_name) > -1;
              }) :
              this.rows;
          },
          pageStart: function() {
            return (this.currPage - 1) * this.countOfPage;
          },
          totalPage: function() {
            return Math.ceil(this.filteredRows.length / this.countOfPage);
          }
        },
        methods: {
          setPage: function(idx) {
            if (idx <= 0 || idx > this.totalPage) {
              return;
            }
            this.currPage = idx;
          }
        }

        // created: function(){
        // }
      });
        </script>	
	</body>
</html>