module.exports = cds.service.impl(async function(){
    const { EmployeeSet,POs } = this.entities;
    
    this.before('UPDATE',EmployeeSet,(req,res) =>{
        if(parseFloat(req.data.salaryAmount) >= 100000){
           req.error(500,"Salary isvery huge bro"); 
        }
    }); 

    this.on("boost", async req => {
        try {
            const ID = req.params[0];
            console.log("Your purchased order boosted ID ==>" + ID + "will be boosted");
            const tx = cds.tx(req);
            await tx.update(POs).with({
                GROSS_AMOUNT : { '+=' : 20000 },notes : "Boosted"
            }).where(ID);
            //return {};
        } catch (error) {
            return "Error" + error.toString();
        }
    });

    this.on("largestOrder", async req => {
            try {
                const ID = req.params[0];
                console.log("largest order ID is" + ID);
                const tx = cds.tx(req);
                const reply = await tx.read(POs).orderBy({
                    GROSS_AMOUNT : 'desc'
                }).limit(1);
                return reply;
            } catch (error) {
                return "Error" + error.toString();
            }
            
    });
});