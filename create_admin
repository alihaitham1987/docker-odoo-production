import odoo
from odoo import api, SUPERUSER_ID

db_name = 'db_w2fc'  # your database name

odoo.tools.config['db_name'] = db_name
odoo.cli.server.setup_server_environment()

registry = odoo.registry(db_name)
with registry.cursor() as cr:
    env = api.Environment(cr, SUPERUSER_ID, {})
    env['res.users'].create({
        'name': 'Admin',
        'login': 'admin@example.com',
        'password': 'admin123',
        'email': 'admin@example.com',
        'groups_id': [(6, 0, [env.ref('base.group_user').id, env.ref('base.group_system').id])],
    })
    print("Admin user created: admin@example.com / admin123")
