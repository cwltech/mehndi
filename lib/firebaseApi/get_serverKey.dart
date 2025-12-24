// import 'package:googleapis_auth/auth_io.dart';

// class Getserverkey {
//   Future<String> getServerKeyToken() async {
//     final scopes = [
//       'https://www.googleapis.com/auth/userinfo.email',
//       'https://www.googleapis.com/auth/firebase.database',
//       'https://www.googleapis.com/auth/firebase.messaging',
//     ];

//     final client = await clientViaServiceAccount(
//         ServiceAccountCredentials.fromJson({
//           "type": "service_account",
//           "project_id": "mehndiwala-3a364",
//           "private_key_id": "6a33ed44c5dce7a1d6b0c56d5b1bd890644c049e",
//           "private_key":
//               "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC/y7e+wzjge67M\nVajA17c6xwO52l54lMvYaniywPwbEw3AqN2atGrNPYxHath/YpCPRBFcx4savgeG\nuLxr1qY6wzxAuspk3AEHrfd6GVAleo77+XioTTb+DnayQbG9IjwakNKRv0jeHckQ\nKM090X9MtoDDZJj9j1o4uCvHctbcwZIZG7AH+IdlpNpXPCQJoAy+QQFVzAvlVD4W\nc2o6MEZFWV2IhKHe7VFNpfVx8iHyZutPM+wzDtHxpiDHkhYVJJnCqBcL+0e1w5z8\nMqbx5icyofkMnMtkoy6YlECUVVM6pqPiXfNwNhceGvsIPWSpqh2blVSBWsZtAeeA\nxuHqkToJAgMBAAECggEAHd2d9VrBTWolEX+DNtLrHtV6VeNUU6gunTq9zxlbCJJC\nfCOE19V2o2gNTdpW78XMPJWSXeVasBAy7Ckcehm41SytV2e0ItmECuCYSU84xOVH\n76JsxfRkIafkls8WW3Jsc+Hk+uS+TDbM0N3cUTSBWKjl9ccr8Ev1diCY/Jv8K5rE\neUeyfrN3qbDjtG/7GPa/qapJkw2Agiy6MnRzwxL6MdfZgYWbFAI/QfkmNysopx54\n67oGn8g2CRXsOuZZyZCEAi+kh76p48Z3v4BCnrYrjxkhUzBMcanSXJY3njvE0oZb\nh0xZg/X5NjWcujsDXxMFJgTRttMcK09MJRX/2JHW6wKBgQDnoTId4uZAetPPp3Ll\nOE5aT8xuhnrY3UpAwQ+hbOM31rNZkW6ZT08VXYDA8Dh3WsHbQf6OFTpc4NwXNHh8\nTtQw0W9ZRjIjkPXRTbCDzX4disTjJXgREF8lFttizeIN09oyL+5ejbr4MuIPMsXw\nea9RUWxbu2RKJEil6s3VhjOg+wKBgQDT+Z7DgcZyjatTCpHH5MbTWpwkzVeGA3A1\nCP88p1p6iJozLMDaixPumC6IOJeVhaa5xzR7GV1bUQAWn5lNHbMaJw0MvWgR8zfL\nCeGnrmf0pw5fLoQ5cRHR4d44ujyO/605XkCmzwkxADK21R4ksak5KLfKDWw9iP48\n4Y42MNtJywKBgFPZOncvKAK3c+17xE/N7i8rK+nmrJnMoZCHUs0wyZ/xDMOjrdG5\nr/sf+ffd/dLW+84POcLdVF9C1ulfiS4WqyFw70n16ziMxS+bXAaaYMj47wT7D1e+\nAXM/rvM5bFdtFVONnlCEJearJMIzswu2QQzC2OLsFwXv1IybTx+4kP/5AoGAKiuo\n6CAzSKrigJzDr87Vt0p5ceDgHqskcYieroRkvafbdX7bxx6QEpF4AGWx0m9KYf89\nc5fyOK5+pAGQUAUukm9ea0BrKdcHLH+EwwUxbTym4UyxxXO3JdgXi5WRYql+3sDf\nf9AEdhkh/bmcS5SEo/hzx+CvvfY5DgeZcTJ7Dc0CgYEAr3BzctDWSYNwESTh57r5\n7LON4495tC8HdpXeBXEg5qu6E87vVkbqvmFPK6DFUTTe4hpZ6pFeUgH5ZnEqXtd+\noNU+t+N4paEDr/adw12RwNrBnzN7thQYVVKvWpF5RqAb4krzzFDGCJ3BqQ0seAca\nHEPJP1XEDaW2g/0PSuaW4iY=\n-----END PRIVATE KEY-----\n",
//           "client_email":
//               "firebase-adminsdk-fbsvc@mehndiwala-3a364.iam.gserviceaccount.com",
//           "client_id": "108084681873679267761",
//           "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//           "token_uri": "https://oauth2.googleapis.com/token",
//           "auth_provider_x509_cert_url":
//               "https://www.googleapis.com/oauth2/v1/certs",
//           "client_x509_cert_url":
//               "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40mehndiwala-3a364.iam.gserviceaccount.com",
//           "universe_domain": "googleapis.com"
//         }),
//         scopes);
//     final accessServerKey = client.credentials.accessToken.data;
//     return accessServerKey;
//   }
// }
