
export const oktaConfig = {
    clientId: process.env.REACT_APP_CLIENT_ID || "",
    issuer: process.env.REACT_APP_ISSUER || "https://your-okta-domain/oauth2/default",
    redirectUri: 'https://localhost:3000/login/callback',
    scopes: ['openid', 'profile', 'email'],
    pkce: true,
    disableHttpsCheck: true,
};
