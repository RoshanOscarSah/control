# Generated by Django 3.0.5 on 2020-04-20 14:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('music', '0046_auto_20200420_2018'),
    ]

    operations = [
        migrations.AddField(
            model_name='metadata',
            name='total_played',
            field=models.CharField(max_length=50, null=True),
        ),
    ]
