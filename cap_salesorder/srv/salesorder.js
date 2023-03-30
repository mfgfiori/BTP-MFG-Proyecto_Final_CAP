const cds = require("@sap/cds");
const req = require("express/lib/request");
const { SalesOrderHeader } = cds.entities("com.logali.SalesOrder");

module.exports = (srv) => {
//*-------------------READ-------------------*//
    srv.on("READ", "SalesOrderHeader", async (req) => {

        if (req.data.ID !== undefined) {
            return await SELECT.from(SalesOrderHeader).where`ID= ${req.data.ID}`;
        }

        return await cds.transaction(req).run(req.query);

     });  
//*-------------------CREATE-------------------*//
srv.on("CREATE", "SalesOrderHeader", async (req) => {
    console.log("Before", req.data);
    let returnData = await cds.transaction(req).run(
            INSERT.into(SalesOrderHeader).entries({
                Email: req.data.Email,
                FirstName: req.data.FirstName,
                LastName: req.data.LastName,
                Country: req.data.Country,
                CreateOn: req.data.CreateOn,               
                DeliveryDate: req.data.DeliveryDate,
                OrderStatus: req.data.OrderStatus,
                ImageUrl: req.data.ImageUrl                
            })
        )
        .then((resolve, reject) => {
            console.log("Resolve", resolve);
            console.log("Reject", reject);

            if (typeof resolve !== "undefined") {
                return req.data;
            } else {
                req.error(409, "Record Not Inserted");
            }
        })
        .catch((err) => {
            console.log(err);
            req.error(err.code, err.message);
        });
    console.log("Before End", returnData);
    return returnData;
});

srv.before("CREATE", "Orders", (req) => {
    req.data.CreateOn = new Date().toISOString().slice(0, 10);
    return req;
});
//*-------------------UPDATE-------------------*//

srv.on("UPDATE", "SalesOrderHeader", async (req) => {
    let returnData = await cds.transaction(req).run([
            UPDATE(SalesOrderHeader, req.data.Email).set({
                Country: req.data.Country
            }),
        ])
        .then((resolve, reject) => {
            console.log("Resolve: ", resolve);
            console.log("Reject: ", reject);

            if (resolve[0] == 0) {
                req.error(409, "Record Not Found");
            }
        })
        .catch((err) => {
            console.log(err);
            req.error(err.code, err.message);
        });
    console.log("Before End", returnData);
    return returnData;
});

//*-------------------DELETE-------------------*//
    srv.on("DELETE", "SalesOrderHeader", async (req) => {
        console.debug(req.data);
        let returnData = await cds.transaction(req).run(
            DELETE.from(SalesOrderHeader).where({ID : req.data.ID})
        ).then((resolve, reject) => {
            console.log("Resolve", resolve);
            console.log("Reject", reject);
            if (resolve !== 1){
                req.error(409, "Record Not Found");
            }
        }).catch((err) => {
            console.log(err);
            req.error(err.code, err.message);
        });
        console.log("Before End ", returnData);
        return await returnData;
    });
};