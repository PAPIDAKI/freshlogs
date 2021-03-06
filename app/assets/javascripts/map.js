	
// function gmap_show(pmu) {
  // if (pmu) {    // validation check if coordinates are there
    // return 0;
  // }

  // handler = Gmaps.build('Google');    // map init
  // // handler.buildMap({ provider: {
  // }, internal: {id: 'map-canvas'}}, 
  // function(){
  //   markers = handler.addMarkers([    // put marker method
  //     {
  //       "lat": pmu.latitude,    // coordinates from parameter pmu
  //       "lng": pmu.longitude,
  //       "picture": {    // setup marker icon
  //         "url": 'http://www.planet-action.org/img/2009/interieur/icons/orange-dot.png',
  //         "width": 35  ,
  //         "height": 25
  //       },
  //       "infowindow": "<b>" + pmu.produce + "</b><br/> " + pmu.nearest_village 
  //     }
  //   ]);
  
  //   handler.map.centerOn([25.1152474, 35.3148737]);
  //  handler.bounds.extendWith(markers);
  //  handler.fitMapToBounds();
  //  handler.getMap().setZoom(12);    // set the default zoom of the map
  // });
// }

//called from a <script> in pmu#new view with pmu value null 
function gmap_form(pmu) {
  handler = Gmaps.build('Google');    // map init
  handler.buildMap({ provider: {}, internal: {id: 'map-canvas'}}, function(){
    if (pmu && pmu.longitude && pmu.latitude) {    // statement check - new or edit view
      markers = handler.addMarkers([    // print existent marker
        {
          "lat": pmu.latitude,
          "lng": pmu.longitude,
          "picture": {
            "url": 'http://www.planet-action.org/img/2009/interieur/icons/orange-dot.png',
            "width":  35,
            "height": 25
          },
          "infowindow": "<b>" + pmu.produce+ "</b> " + pmu.nearest_village
        }
      ]);
      handler.map.centerOn([35.3148737,25.1152474]);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      handler.getMap().setZoom(12);
    }
    else {    // show the empty map
      // handler.fitMapToBounds();
      handler.map.centerOn([35.31,25.11]);
      handler.getMap().setZoom(12);
    }
  });

  var markerOnMap;
function placeMarker(location) {    // simply method for put new marker on map
    if (markerOnMap) {
      markerOnMap.setPosition(location);
    }
    else {
      markerOnMap = new google.maps.Marker({
        position: location,
        map: handler.getMap()
      });
    }
  }

  google.maps.event.addListener(handler.getMap(), 'click', function(event) {    // event for click-put marker on map and pass coordinates to hidden fields in form
    placeMarker(event.latLng);
    document.getElementById("map_lat").value = event.latLng.lat();
    document.getElementById("map_lng").value = event.latLng.lng();
  });
}


 
 
