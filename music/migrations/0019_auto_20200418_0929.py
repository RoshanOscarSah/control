# Generated by Django 3.0.5 on 2020-04-18 03:44

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('music', '0018_auto_20200418_0925'),
    ]

    operations = [
        migrations.AlterField(
            model_name='metadata',
            name='date_modified',
            field=models.DateField(default=datetime.date.today, verbose_name='Date'),
        ),
        migrations.AlterField(
            model_name='metadata',
            name='file',
            field=models.FileField(null=True, upload_to='musics/'),
        ),
        migrations.AlterField(
            model_name='metadata',
            name='size',
            field=models.IntegerField(null=True),
        ),
        migrations.AlterField(
            model_name='metadata',
            name='year',
            field=models.IntegerField(null=True),
        ),
    ]
