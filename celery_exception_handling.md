# Exception Handling

## https://gist.github.com/darklow/c70a8d1147f05be877c3

``` python


```


## https://stackoverflow.com/questions/16658371/how-to-log-exceptions-occurring-in-a-django-celery-task/45333231#45333231

``` python
import logging

logger = logging.getLogger('your.desired.logger')


class LogErrorsTask(Task):
    def on_failure(self, exc, task_id, args, kwargs, einfo):
        logger.exception('Celery task failure!!!1', exc_info=exc)
        super(LogErrorsTask, self).on_failure(exc, task_id, args, kwargs, einfo)
```

## https://docs.celeryq.dev/en/stable/userguide/tasks.html



## https://www.distributedpython.com/2018/09/04/error-handling-retry/