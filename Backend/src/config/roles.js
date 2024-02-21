const allRoles = {
    admin: ['admin', 'doctor', 'farmer'],
    doctor: ['doctor'],
    farmer: ['farmer'],
};

const roles = Object.keys(allRoles);
const roleRights = new Map(Object.entries(allRoles));

module.exports = {
    roles,
    roleRights,
};