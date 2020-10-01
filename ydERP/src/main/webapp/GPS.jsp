<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<title>Simple Map</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 100%;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

</style>

<!-- jQuery -->
<script
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>

</head>
<body>
	<div id="map"></div>
	<script>   
	
	  var deliverys = [];
	  var paths = [];
	  
      function initMap() {
    	  
    	  var map  = new google.maps.Map (document.getElementById('map'), {
  				zoom: 14,
  				center: {lat: 35.870560, lng: 128.589244} 	 				 	
    	  });

    	  
    	  $.ajax({
    		      url : "getDeliveryListMap", 
                  type:'post',
                  async : false, // ajax를 동기화(순서대로) 처리해야하는 경우 true로하거나 기술하지 않으면 비동기로 작동한다.                    
                  dataType:"json",
                  success : function(result){
                	 /*  console.log(result); */
                      if ( result != null ){
                    	var path=[];
                    	var oldemp = "";
                      	for(i=0; i<result.length; i++) {
                      		if(  oldemp !="" && result[i].EMPLOYEE_ID != oldemp ) {
                      			paths.push(path);
                      			path = [];
                      		}
                      		var addr = [];
                      		addr.push(result[i].NAME + " : " +result[i].LOCATION_DATE);
                      		addr.push(Number(result[i].LOCATION_X));
                      		addr.push(Number(result[i].LOCATION_Y));
                      		deliverys.push(addr);                      		
                      		path.push({lat: Number(result[i].LOCATION_X), lng: Number(result[i].LOCATION_Y)});
                      		oldemp = result[i].EMPLOYEE_ID;
                      	}  
                      	paths.push(path);
                      }
                  }                 
              });
    	  var strokeColor = [ 'black', 'blue', 'green', 'yellow', 'red'];
     	  for(i=0; i<paths.length; i++) {
     		  var flightPath = new google.maps.Polyline({
                  path: paths[i], 
                  geodesic: true,
                  strokeColor: strokeColor[i],                 
                  strokeOpacity: 0.5,
                  strokeWeight: 2
                });
     
               flightPath.setMap(map);
     		  
     	  }
     		  
    	
            
    	  setMarkers(map);
      }
      // Data for the markers consisting of a name, a LatLng and a zIndex for the
      // order in which these markers should display on top of each other.
      
     

      function setMarkers(map) {
        // Adds markers to the map.

        // Marker sizes are expressed as a Size of X,Y where the origin of the image
        // (0,0) is located in the top left of the image.

        // Origins, anchor positions and coordinates of the marker increase in the X
        // direction to the right and in the Y direction down.
        var image = {
          url: "./resources/Lorry_Green_icon-icons.com_54887.png",
          // This marker is 20 pixels wide by 32 pixels high.
          size: new google.maps.Size(32, 32),
          // The origin for this image is (0, 0).
          origin: new google.maps.Point(0, 0),
          // The anchor for this image is the base of the flagpole at (0, 32).
          anchor: new google.maps.Point(0, 32)
        };
        // Shapes define the clickable region of the icon. The type defines an HTML
        // <area> element 'poly' which traces out a polygon as a series of X,Y points.
        // The final coordinate closes the poly by connecting to the first coordinate.
        var shape = {
          coords: [1, 1, 1, 20, 18, 20, 18, 1],
          type: 'poly'
        };
        for (var i = 0; i < deliverys.length; i++) {
          var delivery = deliverys[i];
          var marker = new google.maps.Marker({
            position: {lat: delivery[1], lng: delivery[2]},
            map: map,
            icon: image,
            shape: shape,           
            title: delivery[0],
            zIndex: delivery[3]
          });
        }    	     	 
    	 
        
        //마커 타이틀
          var marker = new google.maps.Marker({
          map: map,          
          animation: google.maps.Animation.DROP,          
          position: {lat: 35.870560, lng: 128.589244},         
          title: 'YedamERP'
        });                

        var content = "YedamERP 본사"; // 말풍선 안에 들어갈 내용        
        
        // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
        var infowindow = new google.maps.InfoWindow({ content: content});
 
        google.maps.event.addListener(marker, "click", function() {
      	  if (marker.getAnimation() !== null) {
              marker.setAnimation(null);
            } else {
              marker.setAnimation(google.maps.Animation.BOUNCE);
            }
        	infowindow.open(map,marker);
        });        
        
        
      }
   
      
    </script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCamjy98JH_E945sg9ey2r_KJlN7SyMJVo&callback=initMap"
		async defer></script>
</body>
</html>