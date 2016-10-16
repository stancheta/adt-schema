-- Adding sample data into ads_role table

INSERT INTO ads_role(id_role, title,  visible_private_notes, visible_agreements, template_script, template_feedback, template_private_notes, template_agreements, id_app)
VALUES(DEFAULT, 'STAFF', TRUE, TRUE,
'Staff must be able to communicate with others effectively, train subordinates, and meet all other requirements of his/her position.',
'- Staff needs improvement of his/her position or goals established for the year.
 + Staff performs above that which is required, makes unique contributions, and achieves exceptional accomplishments.
 ? Question about staffs behavior/decisions.',
 'This is your private notes',
 'This is your agreements', 1);
