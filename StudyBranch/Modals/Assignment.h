//
//  Assignment.h
//  StudyBranch
//
//  Created by Michael Latman on 12/30/14.
//  Copyright (c) 2014 Michael Latman. All rights reserved.
//

#import <Realm/Realm.h>

@interface Assignment : RLMObject
<# Add properties here to define the model #>
@end

// This protocol enables typed collections. i.e.:
// RLMArray<Assignment>
RLM_ARRAY_TYPE(Assignment)
