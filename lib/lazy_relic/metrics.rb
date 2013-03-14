require 'newrelic_rpm'
require 'lazy_resource'

module LazyRelic
  class Metrics
    class << self
      def apply_metrics
        include_method_tracer

        apply_relation_metrics
        apply_resource_metrics
        apply_request_metrics
        apply_typhoeus_hydra_metrics
      end

      def include_method_tracer
        [LazyResource::Relation, LazyResource::Resource, LazyResource::Request, Typhoeus::Hydra].each do |klass|
          klass.class_eval { include ::NewRelic::Agent::MethodTracer }
        end
      end

      def apply_relation_metrics
        LazyResource::Relation.class_eval do
          add_method_tracer :load, 'LazyResource/Relation/load'
        end
      end

      def apply_resource_metrics
        LazyResource::Resource.class_eval do
          add_method_tracer :load, 'LazyResource/Resource/load'
        end

        LazyResource::Resource.instance_eval do
          include ::NewRelic::Agent::MethodTracer
          add_method_tracer :load, 'LazyResource/Resource/load'
        end
      end

      def apply_request_metrics
        LazyResource::Request.class_eval do
          add_method_tracer :parse, 'LazyResource/Request/parse'
        end
      end

      def apply_typhoeus_hydra_metrics
        Typhoeus::Hydra.class_eval do
          add_method_tracer :run_without_logging, 'Typhoeus/Hydra/run'
        end
      end
    end
  end
end
