require "lazy_relic/version"
require "lazy_relic/metrics"

module LazyRelic
  LazyRelic::Metrics.apply_metrics
end
