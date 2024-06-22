const cds = require("@sap/cds");
const { rejects } = require("assert");
const { employees } = cds.entities("shahezad.db.master");


const myService = function(srv){
    srv.on('anyone',(req , res) => {
        "hello" + req.data.msg;
    });

    srv.on("READ","employeeReadSet",async(req,res)=>{
        var result1 = [];
        //var result2 = [];
        //result1 = await cds.tx(req).run(SELECT.from(employees).limit(3))
        //result2 = await cds.tx(req).run(SELECT.from(employees).where({"nameFirst" : "Franco"}));
        
        var whereCond = req.data;
        console.log(whereCond);
        if(whereCond.hasOwnProperty("ID")){
          result1   = cds.tx(req).run(SELECT.from(employees).where(whereCond));
        }else{
          result1  = cds.tx(req).run(SELECT.from(employees).limit(1));  
        } 
        
        return result1;

       // return [result2,result1]

    });

    srv.on("CREATE","employeeInsertSet",async(req,res) => {
        let returnData = cds.tx(req).run([
            INSERT.into(employees).entries([req.data])
        ]
        ).then((resolve,reject)=> {
            if(typeof(req.data) !== undefined){
                return req.data;
            }else{
                req.error(500,"something is wrong with data");
            }
        }).catch(err =>{
            req.error(500,"catch me ka error" + err.toString());
        });
    });

    srv.on("UPDATE","employeeUpdateSet", async(req,res)=> {
        let returnData = cds.tx(req).run([
            UPDATE(employees).set({
                nameFirst: req.data.nameFirst
            }).where ({ID : req.data.ID}),

           UPDATE(employees).set({
            nameLast: req.data.nameLast
           }).where({ID : req.data.ID}) 
        ]).then((resolve,reject) =>{
            if(typeof(resolve) !== undefined){
                return req.data;
            }else{
              req.error(500,"something is not right");  
            }
        }).catch(err =>{
            req.error(500,"catch blockhai" + err.toString());
        })
    });

}

module.exports = myService;