/**
 * User Profile
 */
const user = {
  userName: "jane.doe@hoxhunt.com",
  nameIdFormat: "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress",
  firstName: "Jane",
  lastName: "Doe",
  displayName: "Jane Doe",
  email: "jane.doe@hoxhunt.com",
  department: "Cellar Operations",
  mobilePhone: "+1-415-555-5141",
};

/**
 * SAML Attribute Metadata
 */
const metadata = [
  {
    id: "firstName",
    optional: false,
    displayName: "First Name",
    description: "The given name of the user",
    multiValue: false,
  },
  {
    id: "lastName",
    optional: false,
    displayName: "Last Name",
    description: "The surname of the user",
    multiValue: false,
  },
  {
    id: "displayName",
    optional: true,
    displayName: "Display Name",
    description: "The display name of the user",
    multiValue: false,
  },
  {
    id: "email",
    optional: false,
    displayName: "E-Mail Address",
    description: "The e-mail address of the user",
    multiValue: false,
  },
  {
    id: "mobilePhone",
    optional: true,
    displayName: "Mobile Phone",
    description: "The mobile phone of the user",
    multiValue: false,
  },
  {
    id: "department",
    optional: true,
    displayName: "Department",
    description: "Department of the user",
    multiValue: false,
  },
  {
    id: "role",
    optional: true,
    displayName: "Role",
    description: "Role of the user",
    options: ["User", "Admin", "SOC Operator"],
  },
];

module.exports = {
  config: { user, metadata },
};
