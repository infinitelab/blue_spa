const mongoose = require("mongoose");

const storeScheduleSchema = new mongoose.Schema({
    store :{
        
    }
});

const StoreSchedule = mongoose.model("StoreSchedule", storeScheduleSchema);

module.exports = StoreSchedule;
