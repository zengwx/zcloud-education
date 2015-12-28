 	function printRunJobTable(data,tab){
			tab.html('<tr><th width="15%">ID</th><th width="15%">名称</th><th width="15%">所属用户</th><th width="15%">开始时间</th><th width="20%" colspan="2">map进度</th><th width="20%" colspan="2">reduce进度</th></tr>');
			for (var i=0; i<data.length; i++) {
			   var mapProgress = (data[i].mapProgress).toFixed(2)*100;
			   var reduceProgress = (data[i].reduceProgress).toFixed(2)*100;
			   console.log("mapProgress",mapProgress);
				var tr1 = "<tr>"; 
				tr1 += "<td>"+data[i].jobId+"</td>";
				tr1 += "<td>"+data[i].jobName+"</td>";
				tr1 += "<td>"+data[i].userName+"</td>";
				tr1 += "<td>"+data[i].starttime+"</td>"; 
				tr1 += '<td width="15%">';
				tr1 +=     '<div class="progress">';
				tr1 +=           '<div class="progress-bar" role="progressbar" aria-valuenow="'+mapProgress+'"';
				tr1 +=                             'aria-valuemin="0" aria-valuemax="100" style="width: '+mapProgress+'%;">';
				tr1 +=                            '<span class="sr-only">'+mapProgress+'%</span>';
				tr1 +=    '</div></div></td>';
				tr1 += '<td>'+mapProgress+'%</td>';
				tr1 += '<td width="15%">';
				tr1 +=     '<div class="progress">';
				tr1 +=           '<div class="progress-bar" role="progressbar" aria-valuenow="'+reduceProgress+'"';
				tr1 +=                             'aria-valuemin="0" aria-valuemax="100" style="width: '+reduceProgress+'%;">';
				tr1 +=                            '<span class="sr-only">'+reduceProgress+'%</span>';
				tr1 +=    '</div></div></td>';
				tr1 += '<td>'+reduceProgress+'%</td></tr>';
				tab.append(tr1);  
		  }
          }
        
       function printJobTable(data,tab){
    	   for (var i=0; i<data.length; i++) {
     	      var tr1 = "<tr>"; 
	         tr1 += "<td>"+data[i].jobId+"</td>";
	         tr1 += "<td>"+data[i].jobName+"</td>";
	         tr1 += "<td>"+data[i].userName+"</td>";
	         tr1 += "<td>"+data[i].starttime+"</td>"; 
	         tr1 += '</tr>';    
	         tab.append(tr1);                          
     		}   
         }
        
      function getRuningJob(){
    	  $.ajax({//调用JQuery提供的Ajax方法 
				type : "GET",
				url : "jobtracker",
				dataType : "json",
				success : function(data){//回调函数 
					console.log(data);
					if(data.running.length > 0){
						console.log("执行了getRuningJob方法");
						window.setTimeout(getRuningJob,1000);//休息1S后执行getRuningJob方法
						printRunJobTable(data.running,$("#tab_running"));
					}
				},
				error : function() {
					alert("系统出现问题");
				}
			});
         }
      
      function getOtherJob(){
    	  $.ajax({//调用JQuery提供的Ajax方法 
				type : "GET",
				url : "jobtracker",
				dataType : "json",
				success : function(data){//回调函数 
					//console.log(data);
					printRunJobTable(data.failed,$("#tab_failed"));
		        	printJobTable(data.completed,$("#tab_completed"));
		        	printJobTable(data.killed,$("#tab_killed"));
				},
				error : function() {
					alert("系统出现问题");
				}
			});
         }
      