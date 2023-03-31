const cds = require("@sap/cds");
const req = require("express/lib/request");
const { SalesOrderHeader } = cds.entities("com.logali.SalesOrder");

module.exports = (srv) => {

    //*-------------------READ-------------------*//
    srv.after('READ', 'SalesOrderHeader', each => {
        switch (each.OrderStatus) {
            case 0:
                each.StatusText = 'New';                
                break;
            case 1:
                each.StatusText = 'Cancel';                
                break;
            case 2:
                each.StatusText = 'Processing';                
                break;
            case 3:
                each.StatusText = 'Complete';                
                break;
            default:
                break;
        }

    })
    //*************ACTION*****************//
    srv.on("cancelSalesOrder", async (req) => {
        const id = req.params[0]

        let succeeded = await await UPDATE(SalesOrderHeader).set({
            OrderStatus: 1,
        }).where({ ID: id });

        if (!succeeded) {
            let order = await SELECT.one`ID, Email , OrderStatus`.from(req._target)
            if (!order) throw req.reject(404, `Order "${order.ID}" does not exist; may have been deleted meanwhile.`)
            if (order.status === 'A') req.reject(400, `Order placed by "${order.Email}" has been canceled already.`)
        }
    });
}