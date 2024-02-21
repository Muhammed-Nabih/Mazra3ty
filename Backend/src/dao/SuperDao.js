class SuperDao {
    constructor(model) {
        this.Model = require(`../models/${model}Model`);
    }

    async create(data) {
        try {
            const newCreated = new this.Model(data);
            const savedUser = await newCreated.save();
            return savedUser;
        } catch (error) {
            console.log(error);
            throw new Error('Error creating user');
        }
    }


    async findAll(query) {
        try {
            const page = query.page * 1 || 1;
            const limit = query.limit * 1 || 10;
            const skip = (page - 1) * limit;
            const all = await this.Model.find({}).skip(skip).limit(limit)
            return all;
        } catch (error) {
            throw new Error('Error find All Dao');
        }
    }


    async findById(id) {
        try {
            return await this.Model.findById(id);
        } catch (error) {
            throw new Error('Error fetching find By Id Dao');
        }
    }


    async findLastCreated() {
        try {
            return await this.Model.findOne({})
                .sort({ createdAt: -1 }) // Sort by createdAt field in descending order
                .limit(1); // Limit the result to 1 document
        } catch (error) {
            throw new Error('Error fetching find Last Created Dao');
        }
    }


    async updateLastCreated(updateData, key) {
		try {
			// Find the last created document
			const lastCreatedDoc = await this.findLastCreated();
			
			if (lastCreatedDoc) {
				// Update the last created document with the provided data
				lastCreatedDoc[key] = updateData;
				await lastCreatedDoc.save();
				return lastCreatedDoc;
			} else {
				throw new Error('No document found to update');
			}
		} catch (error) {
			throw new Error('Error updating last created document');
		}
	}	


    async findByWhere(where) {
        try {
            return await this.Model.findOne(where);
        } catch (error) {
            throw new Error('Error fetching find By Where Dao');
        }
    }


    async updateById(id, updatedData) {
        try {
            return await this.Model.findByIdAndUpdate(id, updatedData, { new: true });
        } catch (error) {
            throw new Error('Error updating update By Id Dao');
        }
    }


    async deleteById(id) {
        try {
            return await this.Model.findByIdAndDelete(id);
        } catch (error) {
            throw new Error('Error deleting Dao');
        }
    }

}
module.exports = SuperDao;