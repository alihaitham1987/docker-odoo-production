FROM odoo:16

# Copy your custom addons
COPY ./local-addons /mnt/extra-addons

# Make sure the Odoo user has access
USER root
RUN chown -R odoo:odoo /mnt/extra-addons

USER odoo

# Use environment variables provided by Render (set them in the dashboard)
COPY create_admin.py /create_admin.py

CMD odoo --db_host=$PGHOST --db_port=$PGPORT --db_user=$PGUSER --db_password=$PGPASSWORD \
    --addons-path=/mnt/extra-addons,/usr/lib/python3/dist-packages/odoo/addons && \
    python3 /create_admin.py

