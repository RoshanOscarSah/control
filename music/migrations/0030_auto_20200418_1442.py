# Generated by Django 3.0.5 on 2020-04-18 08:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('music', '0029_auto_20200418_1424'),
    ]

    operations = [
        migrations.AlterField(
            model_name='metadata',
            name='file',
            field=models.FileField(null=True, upload_to=''),
        ),
    ]
