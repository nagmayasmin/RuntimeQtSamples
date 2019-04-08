
// Copyright 2016 ESRI
//
// All rights reserved under the copyright laws of the United States
// and applicable international laws, treaties, and conventions.
//
// You may freely redistribute and use this sample code, with or
// without modification, provided you include the original copyright
// notice and use restrictions.
//
// See the Sample code usage restrictions document for further information.
//

import QtQuick 2.6
import QtQuick.Controls 1.4
import Esri.ArcGISRuntime 100.4
import Esri.ArcGISExtras 1.1

ApplicationWindow {
    id: appWindow
    width: 800
    height: 600
    title: "GeoPackageRender"

   property string dataPath: System.userHomePath + "/ArcGIS/Runtime/Data/gpkg/"

    // add a mapView component
    MapView {
        id:mapView
        anchors.fill: parent
        focus: true


        Map {

             BasemapTopographic {}

            FeatureLayer{
                id:featurelayer
                featureTable: gpkg.geoPackageFeatureTables[0]
                renderer: renderer
            }


            // Load the GeoPackage once the Map loads
            onLoadStatusChanged: {
                if (loadStatus === Enums.LoadStatusLoaded)
                    gpkg.load();
                    mapView.setViewpoint(viewPoint);

            }
        }
    }


    ViewpointExtent {
               id: viewPoint
               extent: Envelope {
                   xMin: -104.849899
                   yMin: 39.72225
                   xMax: -104.796126
                   yMax: 39.698843
                   spatialReference: SpatialReference {
                       wkid: 4326
                   }
               }
    }



    SimpleRenderer {
        id: renderer


         PictureMarkerSymbol {
              url: "https://sampleserver6.arcgisonline.com/arcgis/rest/services/Recreation/FeatureServer/0/images/e82f744ebb069bb35b234b3fea46deae"
              width: 30
              height: 30
        }


    }



    GeoPackage{
        id:gpkg
        path:dataPath + "AuroraCO.gpkg"
      }

}

