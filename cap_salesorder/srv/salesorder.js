const cds = require("@sap/cds");
const req = require("express/lib/request");
const { SalesOrderHeader } = cds.entities("com.logali.SalesOrder");

module.exports = (srv) => {
 //*************READ*****************//

    srv.on("READ", "SalesOrderHeader", async (req) => {

        if (req.data.ID !== undefined) {
            return await SELECT.from(SalesOrderHeader).where`ID= ${req.data.ID}`;
        }

        return await cds.transaction(req).run(req.query);

     });
    

    //*************CREATE*****************//

        //*************DELETE*****************//

    /*srv.on("DELETE", "SalesOrderHeader", async (req) => {
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
    });*/
};