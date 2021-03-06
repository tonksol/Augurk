﻿/*
 Copyright 2018, Augurk
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
*/

using System.Collections.Generic;
using System.Linq;
using Raven.Client.Indexes;

namespace Augurk.Api.Indeces.Analysis
{
    ///<summary>
    /// This index persists which indirect invocations are made
    ///</summary>
    public class Features_ByIndirectInvocations : AbstractIndexCreationTask<DbFeature, Features_ByIndirectInvocations.Feature>
    {
        public Features_ByIndirectInvocations()
        {
            Map = features => from feature in features    
                              select new
                              {
                                  feature.Title,
                                  feature.Product,
                                  feature.Group,
                                  IndirectInvocations = feature.DirectInvocationSignatures.SelectMany(dis => LoadDocument<DbInvocation>(dis).InvokedSignatures)
                              };

            StoreAllFields(Raven.Abstractions.Indexing.FieldStorage.Yes);
        }

        public class Feature
        {
            public string Title { get; set; }
            public string Product { get; set; }
            public string Version { get; set; }
            public IList<string> IndirectInvocations { get; set; }
        }
    }
}
