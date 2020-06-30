# Generated by Django 3.0.5 on 2020-04-22 13:46

import datetime
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('music', '0060_auto_20200422_1928'),
    ]

    operations = [
        migrations.AddField(
            model_name='library',
            name='date_added',
            field=models.DateField(default=datetime.date.today, verbose_name='Date'),
        ),
        migrations.AddField(
            model_name='library',
            name='metadata',
            field=models.ForeignKey(default=django.utils.timezone.now, on_delete=django.db.models.deletion.CASCADE, to='music.metadata'),
            preserve_default=False,
        ),
    ]
