# Generated by Django 3.0.5 on 2020-04-22 14:22

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('music', '0064_recent'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='recent',
            name='albums',
        ),
        migrations.RemoveField(
            model_name='recent',
            name='artist',
        ),
    ]
