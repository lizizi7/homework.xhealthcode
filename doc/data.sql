INSERT INTO xhealthcode.adminuser (adminUserId, teacherId, password, role) VALUES (1, 1, '25D55AD283AA400AF464C76D713C07AD', 2);
INSERT INTO xhealthcode.adminuser (adminUserId, teacherId, password, role) VALUES (2, 2, '25D55AD283AA400AF464C76D713C07AD', 1);
INSERT INTO xhealthcode.adminuser (adminUserId, teacherId, password, role) VALUES (3, 4, '25D55AD283AA400AF464C76D713C07AD', 0);
INSERT INTO xhealthcode.college (collegeId, name) VALUES (1, '信息工程学院');
INSERT INTO xhealthcode.college (collegeId, name) VALUES (2, '计算机科学与技术学院');
INSERT INTO xhealthcode.college (collegeId, name) VALUES (3, '生物工程学院');
INSERT INTO xhealthcode.college (collegeId, name) VALUES (15, '教育科学与技术学院');
INSERT INTO xhealthcode.dailycard (dailyCardId, userId, answer, result, date) VALUES (4, 2, '{"phone":"12345678900","isArrivedInfectedArea":"n","isBeenAbroad":"n","isContactedPatient":"n","isDefiniteDiagnosis":"n"}', 0, '2020-06-16');
INSERT INTO xhealthcode.dailycard (dailyCardId, userId, answer, result, date) VALUES (5, 8, '{"phone":"12345678900","isArrivedInfectedArea":"n","isBeenAbroad":"n","isContactedPatient":"n","isDefiniteDiagnosis":"n"}', 0, '2020-06-16');
INSERT INTO xhealthcode.dailycard (dailyCardId, userId, answer, result, date) VALUES (6, 7, '{"phone":"12345678900","isArrivedInfectedArea":"n","isBeenAbroad":"n","isContactedPatient":"n","isDefiniteDiagnosis":"n"}', 0, '2020-06-16');
INSERT INTO xhealthcode.dailycard (dailyCardId, userId, answer, result, date) VALUES (7, 2, '{"isArrivedInfectedArea":"n","isBeenAbroad":"y","isContactedPatient":"n","isDefiniteDiagnosis":"n"}', 1, '2020-06-16');
INSERT INTO xhealthcode.dailycard (dailyCardId, userId, answer, result, date) VALUES (8, 2, '{"isArrivedInfectedArea":"n","isBeenAbroad":"n","isContactedPatient":"n","isDefiniteDiagnosis":"n","illness":["2","4"]}', 2, '2020-06-16');
INSERT INTO xhealthcode.dailycard (dailyCardId, userId, answer, result, date) VALUES (9, 6, '{"phone":"12345678900","isArrivedInfectedArea":"n","isBeenAbroad":"n","isContactedPatient":"n","isDefiniteDiagnosis":"n"}', 0, '2020-06-16');
INSERT INTO xhealthcode.dailycard (dailyCardId, userId, answer, result, date) VALUES (10, 2, '{"isArrivedInfectedArea":"n","isBeenAbroad":"n","isContactedPatient":"n","isDefiniteDiagnosis":"n"}', 0, '2020-06-17');
INSERT INTO xhealthcode.dailycard (dailyCardId, userId, answer, result, date) VALUES (11, 7, '{"isArrivedInfectedArea":"n","isBeenAbroad":"n","isContactedPatient":"n","isDefiniteDiagnosis":"n"}', 0, '2020-06-17');
INSERT INTO xhealthcode.dailycard (dailyCardId, userId, answer, result, date) VALUES (12, 8, '{"isArrivedInfectedArea":"n","isBeenAbroad":"n","isContactedPatient":"n","isDefiniteDiagnosis":"n"}', 0, '2020-06-17');
INSERT INTO xhealthcode.dailycard (dailyCardId, userId, answer, result, date) VALUES (13, 6, '{"isArrivedInfectedArea":"n","isBeenAbroad":"n","isContactedPatient":"n","isDefiniteDiagnosis":"n"}', 0, '2020-06-17');
INSERT INTO xhealthcode.dailycard (dailyCardId, userId, answer, result, date) VALUES (14, 2, '{"isArrivedInfectedArea":"n","isBeenAbroad":"n","isContactedPatient":"n","isDefiniteDiagnosis":"n"}', 0, '2020-06-18');
INSERT INTO xhealthcode.dailycard (dailyCardId, userId, answer, result, date) VALUES (15, 6, '{"isArrivedInfectedArea":"n","isBeenAbroad":"n","isContactedPatient":"n","isDefiniteDiagnosis":"n"}', 0, '2020-06-26');
INSERT INTO xhealthcode.dailycard (dailyCardId, userId, answer, result, date) VALUES (16, 2, '{"isArrivedInfectedArea":"n","isBeenAbroad":"n","isContactedPatient":"n","isDefiniteDiagnosis":"n"}', 0, '2020-06-26');
INSERT INTO xhealthcode.dailycard (dailyCardId, userId, answer, result, date) VALUES (17, 2, '{"isArrivedInfectedArea":"n","isBeenAbroad":"n","isContactedPatient":"n","isDefiniteDiagnosis":"n"}', 0, '2020-06-26');
INSERT INTO xhealthcode.dailycard (dailyCardId, userId, answer, result, date) VALUES (18, 2, '{"isArrivedInfectedArea":"n","isBeenAbroad":"n","isContactedPatient":"n","isDefiniteDiagnosis":"n"}', 0, '2020-06-26');
INSERT INTO xhealthcode.dailycard (dailyCardId, userId, answer, result, date) VALUES (19, 2, '{"isArrivedInfectedArea":"n","isBeenAbroad":"n","isContactedPatient":"n","isDefiniteDiagnosis":"n"}', 0, '2020-06-26');
INSERT INTO xhealthcode.info (infoId, userId, phone, result, date, continuousClockDays) VALUES (3, 2, '12345678900', 2, '2020-06-29', 6);
INSERT INTO xhealthcode.info (infoId, userId, phone, result, date, continuousClockDays) VALUES (5, 7, '12345678900', 1, '2020-06-29', 6);
INSERT INTO xhealthcode.info (infoId, userId, phone, result, date, continuousClockDays) VALUES (6, 6, '12345678900', 0, '2020-06-26', 3);
INSERT INTO xhealthcode.profession (professionId, collegeId, name) VALUES (1, 2, '软件工程');
INSERT INTO xhealthcode.profession (professionId, collegeId, name) VALUES (2, 2, '计算机科学与技术');
INSERT INTO xhealthcode.profession (professionId, collegeId, name) VALUES (3, 2, '数字媒体技术');
INSERT INTO xhealthcode.profession (professionId, collegeId, name) VALUES (4, 2, '嵌入式系统开发');
INSERT INTO xhealthcode.student (studentId, userId, name, idCard, number, xClassId) VALUES (1, 2, '学生1', '330124199906000003', '201806000003', 2);
INSERT INTO xhealthcode.student (studentId, userId, name, idCard, number, xClassId) VALUES (2, 4, '学生2', '330124199906000004', '201806000004', 2);
INSERT INTO xhealthcode.student (studentId, userId, name, idCard, number, xClassId) VALUES (3, 5, '学生3', '330124199906000005', '201806000005', 6);
INSERT INTO xhealthcode.student (studentId, userId, name, idCard, number, xClassId) VALUES (4, 6, '学生4', '330124199906000006', '201806000006', 6);
INSERT INTO xhealthcode.student (studentId, userId, name, idCard, number, xClassId) VALUES (5, 7, '学生5', '330124199906000007', '201806000007', 6);
INSERT INTO xhealthcode.teacher (teacherId, userId, name, idCard, number, collegeId) VALUES (1, 1, '系统管理员', '330124199906000000', '201806061201', null);
INSERT INTO xhealthcode.teacher (teacherId, userId, name, idCard, number, collegeId) VALUES (2, 3, '管理员1', '330124199906000001', '201806060001', 2);
INSERT INTO xhealthcode.teacher (teacherId, userId, name, idCard, number, collegeId) VALUES (3, 8, '普通教师', '330123199906000008', '201806060008', 1);
INSERT INTO xhealthcode.teacher (teacherId, userId, name, idCard, number, collegeId) VALUES (4, 9, '校级管理员', '330327200003000001', '201806060009', 2);
INSERT INTO xhealthcode.user (userId, userType) VALUES (1, 1);
INSERT INTO xhealthcode.user (userId, userType) VALUES (2, 0);
INSERT INTO xhealthcode.user (userId, userType) VALUES (3, 1);
INSERT INTO xhealthcode.user (userId, userType) VALUES (4, 0);
INSERT INTO xhealthcode.user (userId, userType) VALUES (5, 0);
INSERT INTO xhealthcode.user (userId, userType) VALUES (6, 0);
INSERT INTO xhealthcode.user (userId, userType) VALUES (7, 0);
INSERT INTO xhealthcode.user (userId, userType) VALUES (8, 1);
INSERT INTO xhealthcode.user (userId, userType) VALUES (9, 1);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (1, 1, 'w1cR30j1T4PDMYHVOifpAA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (2, 1, 'H9c4Ug49kC9X7fILfkvfcw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (3, 1, 'stK2GONoGLU+2HpOmLX5TA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (4, 1, 'GZIwEXndik02SNxoKL5Ghg==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (5, 1, '8IsBU1Dcogpvs3Vg2lCfIA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (6, 1, 'cv66ZuT1+37E5y/LsfT4fA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (7, 1, '2c42VMVn9KNsaGf75Yyj0Q==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (8, 2, 'aYYdOIC1AvK35JJEKPbF1w==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (9, 1, 'OS7eJRNnmWEQGrUOaT/5Rg==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (10, 1, '//oYhUFiMLxzKWvGjCI9pg==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (11, 2, 'goxRPElpmNJMecYnBen4jg==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (12, 2, 'Dp8zDVK9aNX984A/rTGlUQ==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (13, 1, 'BdXuReOxU7LoXv6xP3p2Jw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (14, 1, 'HCr/afFkGwixpFZSn0ztWA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (15, 1, '3rWsdiIr3etP9sWpcGnFEQ==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (16, 1, 'THtgSSBEUjtVq4MssEq+bA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (17, 2, 'wqGkZj9PbyB6b0QfrHlekw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (18, 1, 'DwTGokx34OwUEFBchgXPkw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (19, 1, '7PDuSR/5XgSJ/qBHJoieuw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (20, 1, '1fer4YjlXxjJBcJxTTPHYw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (21, 1, 'bR2yXdfOwvpOoZ91tID8+Q==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (22, 1, 'wEuvC3XnFLk7nm2Otpk26Q==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (23, 1, 'hYbTac0IcdwZXZRh01jI6w==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (24, 1, '3d/kr2fbxNJcxTwo2NPBIA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (25, 1, 'Xs+JxMnuDl3LUzl+ISBhbQ==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (26, 1, '7AdJdIBQsSzcbqN2pmEEig==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (27, 1, 'Cq6IpAlKk1vf+FhzDl1jRQ==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (28, 1, 'i/2vRsewje7+ueLu5ViBGA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (29, 1, 'ta7DDOsU9NbZ+xRNX7IDng==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (30, 1, 'MDevx4wT4ppAc7HiAO2qQw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (31, 1, 'GWkTD4f7BkPcZ569Ewi/Gw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (32, 1, 'ThmOU27+ivOn7Xd4NGrr7g==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (33, 1, 'CRrGDGkFWvWV1XCV5yqlfQ==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (34, 2, 'EJsOzc7dR5K3Q8WZ1n/u4A==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (35, 2, 'NLL5+DKrEXgn4YSOKHrauA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (36, 2, '5wlE6cS0O41hzy7vB4cxsg==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (37, 2, 'xW7nWKbjdAQfYkSQOTh7NA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (38, 2, 'GsyqeU1gk59pwZ1NHHzyTw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (39, 2, 'vCUdoPDzH7dIzVeGn8Bhbw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (40, 2, '1jOfIkT5iT0OS9YdDPtAiA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (41, 2, 'CgXtBxhbjeaNb3owE4okrA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (42, 2, 'tbdwxEX28gIlD98cAw29ug==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (43, 2, 'lakT7+OPfbwf+FF+nd2pYQ==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (44, 2, 'aJSXiYKHlrV7/TKquneSxA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (45, 2, 'ASZU7IHP9icagjO3lFMW4w==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (46, 2, 'JGinMGnkiW4qrhftcwfaug==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (47, 2, 'vfHg6J/GdCSL4KWZmJxoTg==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (48, 2, 'FGavTumb87QIE65sYH9cfA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (49, 2, 'clIqRXBMGAD/xJl97CR8Lg==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (50, 2, 'J7Jtw1bHbhSepZU+qvSXDw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (51, 2, 'zhlLqAwMhbUWqtcHd7HcxA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (52, 2, 'E2aa89kAuNL+1I4DqACJAw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (53, 2, '5K1kI1p9sh1AHObKROkWaQ==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (54, 2, 'B5WqEb59aE9xi3h0UQ1rHA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (55, 2, 's5XMBKJGQcAJSR59m/0fBQ==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (56, 2, '6x0lDa8mJRQDBghYNAh1/g==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (57, 2, 'pFAa8j5HMq0CFUykLnQ7ow==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (58, 2, '7lrP+UCt/58UKH9u6sE8kA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (59, 2, 'nb9X2PktHET3HuRGIN1DEQ==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (60, 2, 's/cmD8VRQkz+CGVQI/tjOg==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (61, 2, 'vppCLLARvamK9Jtqz24tRA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (62, 2, 'q9PxXWVCFis5Vg6rb3dQtQ==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (63, 2, 'OZyTZpjxxkcBxesD7Fq2mA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (64, 2, 'mo+xlnLMXG3eCo6cvKroIg==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (65, 2, 'PY9IY4ADjoyQfZmYQ41MXw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (66, 2, 'oo5cOYlW9o3FHpb9nOJA+Q==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (67, 8, 'WwS+/q/6fmds21JlY8h+EQ==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (68, 7, 'Qz+NivuYMU9g2FE9EbDeUQ==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (69, 2, 'BktZuGUR4ngyIzMb+mgGRQ==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (70, 2, 'HO9RPyMebOLsxu7EdTI7eg==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (71, 6, '4CXVGcIjRHFrnzcJyKs8Kg==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (72, 2, 'iF71p+F7S3jkavE5DvLikA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (73, 2, 'vhY2HWOleodLycPuhsZZug==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (74, 7, 'h6HKSIXfpRc3wIlhk0eWhQ==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (75, 8, 'AXTVv1lwn7k3/orTvv9Yfw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (76, 2, 'u08UADHILrOtLnLqcWnJHg==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (77, 2, 'Y4lrarp8fgf0cPKUSOp/pg==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (78, 2, 'F8sB+OWpFK0Iz4m8GOI+RA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (79, 2, 'GITTvIIkm+agpiWJKC+Jkw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (80, 2, 'CWl/IGHnEUW9ai68Hvkwcw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (81, 7, 'liqxZEqr0Q1xqj9HY9tOfg==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (82, 5, 'xw5f0j1Ra1Nr2VZ/TMf9Sg==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (83, 5, 'arJYY4cxvBP7LfQK28cW+A==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (84, 5, 'w7MT7E5f+2pXlMhncZRrUw==', '2020-06-20 12:51:19');
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (85, 6, 'B22qnN7NsKcGy3pmzk69VA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (86, 6, 'WeeAyYkxKefLgKJflSYTjQ==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (87, 2, 'XxZlTnGSZ9uH8J6HA1GbtQ==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (88, 8, 'Q/iWvCQR20zeCy6CyIpALg==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (89, 8, 'GyYAXcV5SQx04gZTSddx6A==', '2020-06-20 15:17:15');
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (90, 2, 'TKH1i2V5zdgyWbslDS7dNQ==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (91, 2, 'a/DITxzYhVWwY9ureMM8MA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (92, 2, 'czswOIX7jvaqVritIl/Egw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (93, 2, 'XD5mgpHJ9Zdm98ar5JJ2tw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (94, 1, 'l74Izq0j3Eh2sKeBMvzcQA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (95, 6, 'uJmNcQY9dsceNj8TpCD5MQ==', '2020-06-29 07:21:56');
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (96, 2, 'MW1QdDnOlGo/Hwvise4/8w==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (97, 4, 'u0Qe1BCJd3Q1ww4TyneuEg==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (98, 2, 'nzC5ZQJsbMOq5X2PNntiug==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (99, 2, 'Fn/2rOeLRe0erZsTZUXGCA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (100, 2, 'WJAS21goPa8fXsisX4T9aA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (101, 2, 'YaP1EHNYh7SzpnhTQx2Q+g==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (102, 2, 'qyoALn5kHb8b7p/t0zEYqw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (103, 1, '/JP5MopMjb16Aineg01eMA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (104, 1, 'aKJL9k8IxqYBIQcTdIo3Qg==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (105, 1, 'Lr8uWrjzCNT0K5ni9VwHaw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (106, 1, 'xdVQqnMgH/7P1ZYfcAK5Qw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (107, 1, 'YrRjETgQtbQQx7uXigv2bw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (108, 1, 'hQA5bl9g3d/TyoBefXlyKw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (109, 2, 'hBUpuKM0liUxgg2SBJj2Yw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (110, 4, 'vUuBSL2qUfzxrYudLUdnqg==', '2020-06-29 12:29:19');
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (111, 7, 'ibUwP1HaFv72nZOkWwRHeg==', '2020-06-29 12:34:03');
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (112, 3, 'PYng9w2H1HhGm4QoLoaxSA==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (113, 9, '5UkAaL/ZzuOdbG1w3xbHxQ==', '2020-06-29 13:08:10');
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (114, 3, '5Va3hefL90UgAX0o529VCQ==', '2020-06-29 13:09:35');
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (115, 1, 'zV25dmkcrY2Cwse/mBiytQ==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (116, 1, 'GBm2yFcpGHFa6ga7fkGtUw==', null);
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (117, 1, '5CfRSygA9jUNERXTgEiy8g==', '2020-06-29 14:24:18');
INSERT INTO xhealthcode.useraccess (userAccessId, userId, token, expired) VALUES (118, 2, 'L7+2ydMFjX+Gv/J0fl6TQQ==', '2020-06-29 14:34:00');
INSERT INTO xhealthcode.xclass (xclassId, professionId, name) VALUES (1, 1, '软件工程1802班');
INSERT INTO xhealthcode.xclass (xclassId, professionId, name) VALUES (2, 1, '软件工程1801班');
INSERT INTO xhealthcode.xclass (xclassId, professionId, name) VALUES (3, 1, '软件工程1803班');
INSERT INTO xhealthcode.xclass (xclassId, professionId, name) VALUES (4, 1, '软件工程1804班');
INSERT INTO xhealthcode.xclass (xclassId, professionId, name) VALUES (5, 1, '软件工程1805班');
INSERT INTO xhealthcode.xclass (xclassId, professionId, name) VALUES (6, 2, '计算机科学与技术实验01班');
INSERT INTO xhealthcode.xclass (xclassId, professionId, name) VALUES (7, 2, '计算机科学与技术实验02班');
INSERT INTO xhealthcode.xclass (xclassId, professionId, name) VALUES (8, 2, '计算机科学与技术1801班');
INSERT INTO xhealthcode.xclass (xclassId, professionId, name) VALUES (9, 2, '计算机科学与技术1802班');
INSERT INTO xhealthcode.xclass (xclassId, professionId, name) VALUES (10, 1, '软件工程1806班');