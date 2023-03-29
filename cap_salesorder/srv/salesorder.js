const cds = require("@sap/cds");
const req = require("express/lib/request");
const { SalesOrderHeader } = cds.entities("com.logali.SalesOrder");

module.exports = (srv) => {
 //*************READ*****************//

    /* srv.on("READ", "SalesOrderHeader", async (req) => {

        {ClientEmail : req.data.ClientEmail}
        return await SELECT.from(SalesOrderHeader);
     });*/
    


    //*************CREATE*****************//

        //*************DELETE*****************//
//    srv.on("DELETE", "DeleteOrder", async (req) => {
    srv.on("DELETE", "Orders", async (req) => {
        let returnData = await cds.transaction(req).run(
            DELETE.from(SalesOrderHeader).where({ClientEmail : req.data.ClientEmail})
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