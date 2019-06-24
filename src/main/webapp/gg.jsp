<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Simple Polylines</title>
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
  </head>
  <body>
    <div id="map"></div>
    <script>

      // This example creates a 2-pixel-wide red polyline showing the path of
      // the first trans-Pacific flight between Oakland, CA, and Brisbane,
      // Australia which was made by Charles Kingsford Smith.

      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 15,
          center: {lat: 37.47627910168024, lng: 127.01269825903317},
          mapTypeId: 'terrain'
        });

        var flightPlanCoordinates1 = [
          {lat: 37.772, lng: -122.214},
          {lat: 21.291, lng: -157.821},
          {lat: -18.142, lng: 178.431},
          {lat: -27.467, lng: 153.027}
        ];
        
        /* var flightPlanCoordinates = [
            {lat: 37.91388273017708, lng: 128.18116208799725},
            {lat: 37.913998431001566, lng: 128.18099829948605},
            {lat: 37.91423590024892, lng: 128.18066436233167},
            {lat: 37.91457305624227, lng: 128.18021104912478},
            {lat: 37.91457393211532, lng: 128.18020986114914},
            {lat: 37.91478768147902, lng: 128.17990851865017},
            {lat: 37.914843275452846, lng: 128.1798313625003},
            {lat: 37.91484415046682, lng: 128.17983008011802},
            {lat: 37.91489452578043, lng: 128.1797565806067},
            {lat: 37.914895244542464, lng: 128.17975551747276},
            {lat: 37.9148959311738, lng: 128.17975442425941},
            {lat: 37.91489661960664, lng: 128.17975333107486},
            {lat: 37.91499790019788, lng: 128.17958589293},
            {lat: 37.91499868154213, lng: 128.1795845180733},
            {lat: 37.91499946288637, lng: 128.17958314321666},
            {lat: 37.91511449474931, lng: 128.1793721741615},
            {lat: 37.915115056469034, lng: 128.17937104938056},
            {lat: 37.91511564972644, lng: 128.17936992396602},
            {lat: 37.91511621324763, lng: 128.17936879921385},
            {lat: 37.91518033831136, lng: 128.17923483054423},
            {lat: 37.91518093190864, lng: 128.17923358118227},
            {lat: 37.915181494298615, lng: 128.17923229948147},
            {lat: 37.915249900777475, lng: 128.17907436268655},
            {lat: 37.91525052481403, lng: 128.1790728624948},
            {lat: 37.91525115007029, lng: 128.1790713304819},
            
            
        ]; */
        
        var flightPlanCoordinates = [
        	
        ];
        
        var aa =[
        	[
                127.01881408209643,
                37.46338384507189
              ],
              [
                127.01798534497651,
                37.465176190647924
              ],
              [
                127.01643062998531,
                37.46826057749618
              ],
              [
                127.01556658343313,
                37.4699816963593
              ],
              [
                127.0148484979224,
                37.47137379609237
              ],
              [
                127.01413923720925,
                37.47279442147108
              ],
              [
                127.01350308180498,
                37.47404323382478
              ],
              [
                127.01304107323527,
                37.47500289382062
              ],
              [
                127.01291626258195,
                37.47532376436935
              ],
              [
                127.01276252206728,
                37.47587917616084
              ],
              [
                127.01269825903317,
                37.47627910168024
              ],
              [
                127.01266032702264,
                37.476680161393446
              ],
              [
                127.01265831490551,
                37.47698998819738
              ],
              [
                127.01266500328306,
                37.47731183261966
              ],
              [
                127.01273286171896,
                37.47772679518927
              ],
              [
                127.01282849996427,
                37.47821394175341
              ],
              [
                127.01308795924716,
                37.47985831568413
              ],
              [
                127.0131385021781,
                37.48048993190561
              ],
              [
                127.01311684577989,
                37.480911979574486
              ],
              [
                127.01269783453627,
                37.48188176147425
              ],
              [
                127.01213971171651,
                37.483036180000994
              ]
        ];

        for(var i = 0; i < aa.length; i++){
        	var temp = {lat: aa[i][1], lng: aa[i][0]};
        	
        	flightPlanCoordinates.push(temp);
        }
        
        var flightPath = new google.maps.Polyline({
          path: flightPlanCoordinates,
          geodesic: true,
          strokeColor: '#FF0000',
          strokeOpacity: 1.0,
          strokeWeight: 4
        });
        
        flightPath.addListener('click', function() {
            alert("aaa");
        });

        flightPath.setMap(map);
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBj-ap3L2jBJ4qhaShQmpXukUQ9M1qTh_o&callback=initMap"
        async defer></script>
  </body>

</html>