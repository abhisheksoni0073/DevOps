__Creating a user__

You can use specific database instead of admin

    use admin
    db.createUser(
      {
        user: "yehaiusername",
        pwd: "passwordtojabarjasthai",
        roles: [ "clusterMonitor", "readAnyDatabase" ]
      }
    )

__Mongo Restore__
    
    mongorestore --username=user --password=pass --authenticationDatabase=admin database
    mongo --username=user --password=pass --authenticationDatabase=admin 


__MongoDB State__

    db["orders"].stats();

__List indexes in mongo__

    db.getCollectionNames().forEach(function(collection) {
      indexes = db[collection].getIndexes();
      print("Indexes for " + collection + ":");
      printjson(indexes);
    });

__Listing the indexes per Collection with total indexes__

    total=0;
    db.getCollectionNames().forEach(function(collection) {
        print(collection + ": " + db[collection].getIndexes().length);
        total = total + db[collection].getIndexes().length;
    });
    print("Total Number of Indexes: " + total);


__Listing the number of records__

    total=0;
    db.getCollectionNames().forEach(function(collection) {
        temp=0;
        temp=db[collection].count();
        print(collection + ": " + temp);
        total = total + temp;
    });
    print("Total Number of Records: " + total);


__Avrage size of objects__

    total=0;
    counter=0;
    avg=0;
    db.getCollectionNames().forEach(function(collection) {
        counter=counter+1;
        temp=0;
        temp=db[collection].stats().avgObjSize;
        if (temp != "undefined"){
          print(collection + ": " + temp);
          total = total + temp;    
        } else {
          counter=counter-1;
        }
    });
    avg = total / counter;
    print("Avrage Object Size: " + avg);


__Mongo Storage Type__

    db.serverStatus().storageEngine