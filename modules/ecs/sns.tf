# SNS topic to send emails with the Alerts
resource "aws_sns_topic" "alarm" {
  name            = "ECS_Alarms"
  delivery_policy = <<EOF
{
  "http": {
    "defaultHealthyRetryPolicy": {
      "minDelayTarget": 20,
      "maxDelayTarget": 20,
      "numRetries": 3,
      "numMaxDelayRetries": 0,
      "numNoDelayRetries": 0,
      "numMinDelayRetries": 0,
      "backoffFunction": "linear"
    },
    "disableSubscriptionOverrides": false,
    "defaultThrottlePolicy": {
      "maxReceivesPerSecond": 1
    }
  }
}
EOF
}

resource "aws_sns_topic_subscription" "email-target" {
  topic_arn = aws_sns_topic.alarm.arn
  protocol  = "email"
  endpoint  = "rances.acosta21@gmail.com"
}