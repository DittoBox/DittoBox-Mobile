// Facility Model
  class Facility {
    final String title;
    final String location;
    final int containers;
    final int alerts;
    final int workers;
    //final int accountid;

    Facility({
      required this.title,
      required this.location,
      required this.containers,
      required this.alerts,
      required this.workers,
      //required this.accountid,
    });

    factory Facility.fromJson(Map<String, dynamic> json) {
      return Facility(
        title: json['title'],
        location: json['location'],
        containers: json['containers'],
        alerts: json['alerts'],
        workers: json['workers'],
        //accountid: json['accountid'],
      );
    }

    Map<String, dynamic> toJson() {
      return {
        'title': title,
        'location': location,
        'containers': containers,
        'alerts': alerts,
        'workers': workers,
        //'accountid': accountid,
      };
    }


    
  }

