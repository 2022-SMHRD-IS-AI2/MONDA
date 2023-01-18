<%@page import="com.smhrd.model.fullcalendarVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset='utf-8' />
<link href='lib/main.css' rel='stylesheet' />
<script src='lib/main.js'></script>
 <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

<script>
<%
	fullcalendarVO selectOne = (fullcalendarVO)session.getAttribute("selectOne");
	
%>
  document.addEventListener('DOMContentLoaded', function() {
              
    var calendarEl = document.getElementById('calendar');

    $.ajax({
    	url:"fullcalendarCON",
    	dataType:"JSON",
    	success:function(result){
    		console.log(result);
    		showCalendar(result);
    	}
    });
    
    
    function showCalendar(result){
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: '2023-01-17',
      
      /* initialView: 'timeGridWeek', //주단위로 보기위한 캘린더
      headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
      }, */
      
      editable: true,
      droppable: true, // 물건들을 달력에 떨어뜨릴 수 있게 해준다
      drop: function (arg) {
          // is the "remove after drop" checkbox checked?
          if (document.getElementById('drop-remove').checked) {
              // 드롭 후 제거 확인란이 선택되어 있습니까?
              arg.draggedEl.parentNode.removeChild(arg.draggedEl);
          }
      }
      ,
      navLinks: true, // 일/주 이름을 클릭하여 보기를 탐색할 수 있습니다
      selectable: true,
      selectMirror: true,
      select: function(arg) {  // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
    	  
    	  
        var title = prompt('일정을 입력해주세요.');
        if (title) {
        
        	calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
            
          })
        }
        var allEvent = calendar.getEvents();// .getEvents() 함수로 모든 이벤트를 Array 형식으로 가져온다. (FullCalendar 기능 참조)
        
        var events = new Array(); // Json 데이터를 받기 위한 배열 선언
        for (var i = 0; i < allEvent.length; i++) {
            var obj = new Object();     // Json 을 담기 위해 Object 선언
            // alert(allEvent[i]._def.title); // 이벤트 명칭 알람
            obj.title = allEvent[i]._def.title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
            obj.start = allEvent[i]._instance.range.start; // 시작
            obj.end = allEvent[i]._instance.range.end; // 끝

            events.push(obj);
        }
        var jsondata = JSON.stringify(events);
        console.log(jsondata); 
         //saveData(jsondata);
        
        //function saveData(jsondata) {
            $.ajax({
                url: "fullcalendarupdateCon",
                method: "POST",
                dataType: "text", /* 응답받을 데이터의 형태 */
                data: {
                	'jsondata' : JSON.stringify(events),
                },
                success : function (result) {
                    alert(result);
                },
                error : function (request, status, error) {
                     alert("에러 발생" + error);
                }
            });
            calendar.unselect()
        //};
        
        
        
      },
      eventClick: function(arg) {
        if (confirm('일정을 삭제 하시겠습니다?')) {
          arg.event.remove()
        }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
        events : result   /* [{
          title: 'All Day Event',
          start: '2020-09-01'
        },
        {
          title: 'Long Event',
          start: '2020-09-07',
          end: '2020-09-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2020-09-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2020-09-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2020-09-11',
          end: '2020-09-13'
        },
        {
          title: 'Meeting',
          start: '2020-09-12T10:30:00',
          end: '2020-09-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2020-09-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2020-09-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2020-09-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2020-09-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2020-09-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2020-09-28'
        } 
      ] */
    });

    calendar.render();
    
    }
  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  <div id='calendar'></div>

</body>
</html>